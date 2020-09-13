# Chatlog Converter

Converts Adium (and iChat) chat logs into HTML.

## Download source and build the Docker image

```
git clone git@github.com:radiantnode/chatlog-converter.git
cd chatlog-converter
docker build --tag chatlog-converter .
```

## Running the converter

You will need to mount two volumes: `/mnt/chats` which is the directory that contains the `.chatlog` files, and `/mnt/html` which will be where converted logs will be written.

```
docker run \
  --interactive --tty \
  --volume '/Users/michael/Library/Application Support/Adium 2.0/Users/Default/Logs/AIM.radiantnode':/mnt/chats \
  --volume ~/Desktop/html:/mnt/html \
  chatlog-converter
```

### Available options

You can pass any of these options as an `--env` on the run command:

| Option        | Description                                       | Default            |
|---------------|---------------------------------------------------|--------------------|
| `CHATS_DIR`   | The directory where to read the chatlogs.         | `/mnt/chats`       |
| `HTML_DIR`    | The directory where the final HTML is built.      | `/mnt/html`        |
| `CHATLOG_EXT` | The extension of the chat logs in the chats dir.  | `.chatlog`         |
| `IMAGE_EXTS`  | Extensions used to search for images in the logs. | `png,jpg,jpeg,gif` |
| `SUBDIR`      | If provided will only process that subdirectory.  | `nil`              |

## Converting iChat transcripts to Adium

If you have iChat transcripts and want to use this converter, you will need to convert them to Adium chat logs first. Adium has a built-in importer to do this.

1. Make sure your iChat transcripts are in `~/Documents/iChats`
2. [Download Adium](https://adium.im/)
3. Open Adium and setup at least one account (can be Bonjour for simplicity)
4. Go to File > Import > iChat Accounts, Statuses, and Transcripts
5. Make sure "Transcripts" is checked and continue the steps
6. Imported logs are now available in `~/Library/Application Support/Adium 2.0/Users/Default/Logs/...`
