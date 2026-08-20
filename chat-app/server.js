import http from 'http';
import fs from 'fs';
import { WebSocketServer } from 'ws';

const PORT = 3001;
const server = http.createServer((req, res) => {
    fs.readFile('./public/index.html', (err, data) => {
        if (err) {
            res.writeHead(500);
            res.end('Error loading index.html');
            return;
        }
        res.writeHead(200, { 'Content-Type': 'text/html' });
        res.end(data);
    });
});
const wss = new WebSocketServer({ server });

function broadcast(data) {
    const payload = JSON.stringify(data);
    wss.clients.forEach((client) => {
        if (client.readyState === WebSocket.OPEN) {
            client.send(payload);
        }
    });
}

wss.on('connection', (socket, req) => {
    const username = new URL(req.url, 'http://localhost').searchParams.get('username') || 'Anonymous';

    // Broadcast join message to all clients
    broadcast({ type: 'system', text: `${username} joined` });

    // Handle incoming chat messages
    socket.on('message', (raw) => {
        try {
            const { username: msgUser, text } = JSON.parse(raw.toString());
            broadcast({ type: 'chat', username: msgUser || username, text });
        } catch {
            // Ignore malformed messages
        }
    });

    // Handle client disconnection
    socket.on('close', () => {
        broadcast({ type: 'system', text: `${username} left` });
    });
});

server.listen(PORT, () => {
    console.log(`Server is running on localhost:${PORT}`);
})
