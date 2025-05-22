# Log Files Compressor

A lightweight Bash script to find and compress `.log` files in a specified directory using `tar` + `gzip`.  
Perfect for quick log cleanups or archiving sessions.

---

## Features

-  Scans the given directory for `.log` files (non-recursive)
-  Compresses all found logs into a `.tar.gz` archive
-  Auto-generates archive name with timestamp (`YYYY-MM-DD_HHMMSS`)
-  Simple CLI usage, no dependencies beyond standard Linux tools

---

## Usage

```bash
chmod +x find_and_compress.sh
./find_and_compress.sh <directory_path>
```

## Example Output
```bash
ubuntu@ubuntu:~/scripts$ ./find_and_compress.sh $HOME/scripts/
/home/ubuntu/scripts/access.log
Compression succeeded.

ubuntu@ubuntu:~/scripts$ tar -tf compressed_logs_2025-05-23_001216.tar.gz
home/ubuntu/scripts/access.log
```

## Limitations
- Only scans the top-level of the given directory (no recursive search)
- Only compresses files with .log extension
- Will overwrite logs inside the archive but not outside it — use responsibly
