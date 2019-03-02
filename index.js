const {
  app,
  BrowserWindow,
  Menu,
  Tray
} = require('electron');

const path = require('path')
const url = require('url')
let tray = null;

app.on('ready', () => {
  mainWindow = createWindow();

  // Tray setup
  tray = new Tray("icon.png");
  const contextMenu = Menu.buildFromTemplate([
    { label: 'Open', click: () => { mainWindow.show() }},
    { label: 'Exit', click: () => {
        mainWindow.removeAllListeners('close');
        mainWindow.close();
      }
    }
  ]);
  tray.setContextMenu(contextMenu);

  // page setup
  const page = mainWindow.webContents;
});

function createWindow() {
  win = new BrowserWindow({
    autoHideMenuBar: true,
    webPreferences: {
      nodeIntegration: false,
      plugins: true
    }
  });

  win.loadURL("https://web.telegram.org/");

  win.on('close', (e) => {
    e.preventDefault();
    win.hide();
  });

  return win;
}

