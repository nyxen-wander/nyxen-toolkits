# Log Analyzer

A lightweight Bash script that parses access log files and optionally filters output based on the requested resource (e.g., index.html, logo.png, etc.).
Built for fast inspection of web activity from converted .pcap data.

## Features
- Accepts a single log file as input (.log extension).
- Optionally filters the output by a specified resource (e.g., index.html, favicon.ico, etc.).
- Displays:
  - Source IP
  - Request Time
  - Resource Accessed
  - HTTP Status Code
- Works with standard access log format (pre-processed using tools like tshark).

## How to Use
```bash
chmod +x log_analyzer.sh
./log_analyzer.sh <log_file> [resource]
```

## Examples

Analyze entire log file:
```bash
./log_analyzer.sh access.log
```
Filter by resource (index.html):
```bash
./log_analyzer.sh access.log index.html
```

## Sample Output

Unique IP address(es) that accessed index.html:
```bash
Source IP: 192.168.1.10
Time: [10/May/2025:12:00:01+0700]
Resource: /index.html
Status code: 200

Source IP: 192.168.1.12
Time: [10/May/2025:12:00:04+0700]
Resource: /index.html
Status code: 200

Analysis completed.
```

## Limitations
- Only supports log files in text format (typically .log), converted manually from .pcap files using tools like tshark.
- Not optimized for messy or non-standard log formats.
- No fancy UI or pretty colors.
- Doesn't provide statistics or summaries yet (e.g., hit count, frequency, etc.).

## Tips

You can use tshark to convert a .pcap to .log like so:
```bash
tshark -r capture.pcap -T fields -e ip.src -e http.request.uri -e _ws.col.Time -E separator="
```

## Future Improvements
- Add summary stats (e.g., total requests per IP, most accessed resource).
- Support for JSON output format.
- Better error handling and prettier output.
