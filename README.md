# Help Reader

A bionic reading application that enhances text readability.

## Setup

### Prerequisites
- Xcode (latest version recommended)
- A RapidAPI account with access to the Bionic Reading API

### Configuration

This project requires API keys that are not included in the repository for security reasons.

#### Setting up your API keys:

1. **Copy the secrets template:**
   ```bash
   cp Secrets.plist.template Secrets.plist
   ```

2. **Get your RapidAPI key:**
   - Sign up or log in to [RapidAPI](https://rapidapi.com/)
   - Subscribe to the [Bionic Reading API](https://rapidapi.com/bionic-reading-bionic-reading-default/api/bionic-reading1)
   - Copy your API key from the dashboard

3. **Add your key to Secrets.plist:**
   - Open `Secrets.plist` in Xcode or a text editor
   - Replace `YOUR_API_KEY_HERE` with your actual RapidAPI key
   - Save the file

4. **Add Secrets.plist to your Xcode project:**
   - In Xcode, right-click on your project navigator
   - Select "Add Files to [Project Name]"
   - Choose `Secrets.plist`
   - Make sure "Copy items if needed" is checked
   - Ensure your app target is selected

### Important Notes

⚠️ **Never commit `Secrets.plist` to version control!** This file is already listed in `.gitignore` to prevent accidental commits of your API keys.

The `Secrets.plist.template` file is safe to commit and helps other developers set up their own configuration.

## Building and Running

Once you've configured your API keys:

1. Open the project in Xcode
2. Select your target device or simulator
3. Press `Cmd + R` to build and run

## Project Structure

```
help reader/
├── MainViewModel.swift      # Main business logic
├── Config.swift            # Secure configuration management
├── Secrets.plist           # Your API keys (not in Git)
└── Secrets.plist.template  # Template for setup
```

## Features

- Convert regular text to bionic reading format
- Customizable fixation and saccade parameters
- Clean, native interface

## API

This app uses the [Bionic Reading API](https://rapidapi.com/bionic-reading-bionic-reading-default/api/bionic-reading1) via RapidAPI.

## License

Apache 2.0

## Contributing

If you'd like to contribute:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Ensure you don't commit any API keys
5. Submit a pull request
