


---
   ___       __          ___           __      
  / _ \__ __/ /  __ __  / _ \___  ____/ /__ ___
 / , _/ // / _ \/ // / / // / _ \/ __/  '_/(_-<
/_/|_|\_,_/_.__/\_, / /____/\___/_/ /_/\_\/___/
               /___/                           

---

# RubyDorks

RubyDorks is a command-line tool for conducting job search queries across various search engines. It allows users to specify search queries and search engines to retrieve job-related information from the web.

## Installation

To install RubyDorks, follow these steps:

1. Clone the RubyDorks repository to your local machine:

    ```bash
    git clone https://github.com/santedime/rubydorks.git
    ```

2. Navigate to the RubyDorks directory:

    ```bash
    cd rubydorks
    ```

3. Run the installer script:

    ```bash
    ./install.sh
    ```

    Follow the instructions and provide the path to the `main.rb` script when prompted.

4. Once the installation is complete, RubyDorks is ready to use. You can now run `rubydorks` from anywhere in your terminal.

## Usage

To use RubyDorks, run the `rubydorks` command followed by the desired options:

```bash
rubydorks [options]
```

### Options

- `-q, --query QUERY`: Specify the search query.
- `-e, --engines ENGINES`: Specify the search engines to use (comma-separated).
- `-s, --schedule TIME`: Schedule a cron job to run RubyDorks at a specified time.
- `-h, --help`: Print help information.

### Examples

1. Perform a search for software engineer jobs on Google and Bing:

    ```bash
    rubydorks -q "software engineer" -e google,bing
    ```

2. Schedule a daily job search for data analyst positions at 5 AM:

    ```bash
    rubydorks -q "data analyst" -e google,bing -s '0 5 * * *'
    ```

## Contributing

Contributions to RubyDorks are welcome! If you encounter any issues or have ideas for improvements, please submit a pull request or open an issue on the [GitHub repository](https://github.com/yourusername/rubydorks).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Make sure to replace `yourusername` with your GitHub username in the repository URL.

This documentation provides an overview of how to install, use, contribute to, and license RubyDorks. Users can follow these instructions to get started with the tool and contribute to its development.
