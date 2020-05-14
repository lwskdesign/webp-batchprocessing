# webp-batchprocressing

webp-batchprocressing is a PowerShell script to convert all files in a given folder to Google's .webp image format using the [tools](https://developers.google.com/speed/webp/docs/cwebp) provided by Google.

## Installation

Clone or download the repository

## Usage

first you need to enable the execution of unsigned scripts:
1. Start Windows PowerShell with the "Run as Administrator" option.
2. Enable running unsigned scripts by entering:
```PowerShell
set-executionpolicy remotesigned
```
More information: [Running Scripts](https://docs.microsoft.com/en-us/previous-versions//bb613481(v=vs.85)?redirectedfrom=MSDN) at Microsoft TechNet Library.

## Roadmap
- Auto-update of cwebp.exe
- specify input/output path

## License
[MIT](https://choosealicense.com/licenses/mit/)
