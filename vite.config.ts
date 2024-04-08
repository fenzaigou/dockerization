import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  // define the preview expose port
  preview: {
    host: true, // expose to the public address
    port: 8080,
  },
});
