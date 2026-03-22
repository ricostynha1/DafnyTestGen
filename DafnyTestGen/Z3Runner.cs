using System.Diagnostics;

namespace DafnyTestGen;

static class Z3Runner
{
    static readonly int Z3_TIMEOUT_MS = 5000; // 5 seconds per query

    internal static async Task<string> RunZ3(string z3Path, string smtInput)
    {
        var psi = new ProcessStartInfo
        {
            FileName = z3Path,
            Arguments = $"-in -smt2 -model -t:{Z3_TIMEOUT_MS}",
            RedirectStandardInput = true,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            UseShellExecute = false,
            CreateNoWindow = true
        };

        using var process = Process.Start(psi)!;

        try
        {
            await process.StandardInput.WriteAsync(smtInput);
            process.StandardInput.Close();
        }
        catch (IOException)
        {
            try { process.Kill(); } catch { }
            return "timeout";
        }

        // Race the output reading against a timeout.
        // ReadToEndAsync won't complete until the process exits or is killed.
        var outputTask = process.StandardOutput.ReadToEndAsync();
        var errTask = process.StandardError.ReadToEndAsync();
        var allDone = Task.WhenAll(outputTask, errTask);

        if (await Task.WhenAny(allDone, Task.Delay(Z3_TIMEOUT_MS + 5000)) != allDone)
        {
            // Timeout: kill the process to unblock the read tasks
            try { process.Kill(); } catch { }
            return "timeout";
        }

        return outputTask.Result + errTask.Result;
    }

    /// Finds the Dafny executable path (derived from the Z3 path).
    /// </summary>
    internal static string FindDafnyPath()
    {
        var basePath = FindRepoRoot(".repo_verifixer_fault_localization_marker");
        var dafnyDir = Path.Combine(basePath, "dafny");

        foreach (var name in new[] { "dafny.exe", "Dafny.exe", "dafny", "Dafny", "dafny.bat" })
        {
            var path = Path.Combine(dafnyDir, name);
            if (File.Exists(path)) return path;
        }
        return "dafny"; // fallback: assume on PATH
    }

      public static string FindRepoRoot(string marker = ".git")
        {
            var current = new DirectoryInfo(AppDomain.CurrentDomain.BaseDirectory);

            while (current != null)
            {
                if (File.Exists(Path.Combine(current.FullName, marker)) ||
                    Directory.Exists(Path.Combine(current.FullName, marker)))
                {
                    return current.FullName;
                }
                current = current.Parent;
            }

            throw new DirectoryNotFoundException("Could not find repository root. Marker missing: " + marker);
        }
   
}
