import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "WebP Export Plugin for Lightroom Classic — Photo Toolbox",
  description:
    "Free plugin to export WebP directly from Adobe Lightroom Classic. Bundled encoder, no setup required. macOS & Windows.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className="h-full antialiased">
      <body className="min-h-full flex flex-col font-sans">{children}</body>
    </html>
  );
}
