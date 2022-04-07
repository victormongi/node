module.exports = [
  {
    script: "src/index.js",
    name: "app",
    exec_mode: "cluster",
    instances: 2,
    max_memory_restart: "4000M",
    autorestart: true,
  },
];
