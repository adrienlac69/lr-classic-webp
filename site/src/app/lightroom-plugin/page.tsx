import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Export WebP from Lightroom Classic — Free Plugin",
  description:
    "Free Lightroom Classic plugin to export photos as WebP. Bundled cwebp encoder, lossy & lossless, batch export. macOS & Windows.",
};

const DOWNLOAD_URL = "/downloads/photo-toolbox-webp-v1.0.0.zip";
const PLUGIN_VERSION = "1.0.0";
const PLUGIN_SIZE = "1.4 MB";
const SHA256 =
  "64245a80ea1b4b658bd226416347768b2c1df7e98a9677734bc29d51635595e6";

const steps = [
  {
    number: "1",
    title: "Install the plugin",
    description: "Open Lightroom Classic → File → Plug-in Manager → Add, then select the downloaded folder.",
  },
  {
    number: "2",
    title: 'Select "WebP (Photo Toolbox)"',
    description: "In the Export dialog, choose WebP (Photo Toolbox) as the export format.",
  },
  {
    number: "3",
    title: "Configure & export",
    description: "Set quality, lossless mode, metadata options — then hit Export. Done.",
  },
];

const features = [
  {
    title: "Bundled cwebp encoder",
    description: "No separate install needed. The plugin ships with the encoder binary for your platform.",
  },
  {
    title: "Quality 0–100 + lossless",
    description: "Fine-grained lossy compression or perfect lossless mode for maximum flexibility.",
  },
  {
    title: "Presets: photo / drawing / icon / text",
    description: "Optimized compression profiles tuned for different content types.",
  },
  {
    title: "Metadata control",
    description: "Choose to keep EXIF, ICC profiles, XMP — or strip everything for smaller files.",
  },
  {
    title: "Batch export with progress",
    description: "Export hundreds of photos at once with a real progress bar and cancel support.",
  },
  {
    title: "macOS arm64 + Windows x64",
    description: "Native Apple Silicon support and Windows 64-bit. Intel Mac supported too.",
  },
];

const proFeatures = [
  "WebP converter web app",
  "Batch image resizer",
  "EXIF metadata cleaner",
  "AI-powered alt-text generator",
];

export default function LightroomPluginPage() {
  return (
    <div className="flex flex-col min-h-full">
      {/* Hero */}
      <section className="flex flex-col items-center justify-center px-6 pt-24 pb-20 text-center bg-gradient-to-b from-gray-50 to-white dark:from-gray-950 dark:to-gray-900">
        <span className="mb-6 inline-block rounded-full bg-blue-100 px-4 py-1.5 text-sm font-medium text-blue-800 dark:bg-blue-900/40 dark:text-blue-300">
          Works on LR Classic 6.0+ &middot; macOS &amp; Windows
        </span>

        <h1 className="max-w-3xl text-4xl font-bold tracking-tight sm:text-5xl lg:text-6xl">
          Export WebP directly from Lightroom&nbsp;Classic
        </h1>

        <p className="mt-6 max-w-xl text-lg text-gray-600 dark:text-gray-400">
          Free plugin. No setup. Bundled encoder.
        </p>

        <a
          href={DOWNLOAD_URL}
          className="mt-10 inline-flex items-center gap-2 rounded-lg bg-blue-600 px-8 py-3.5 text-lg font-semibold text-white shadow-lg transition hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
        >
          <DownloadIcon />
          Download Free Plugin
        </a>

        <p className="mt-3 text-sm text-gray-500 dark:text-gray-500">
          v{PLUGIN_VERSION} &middot; {PLUGIN_SIZE} &middot; ZIP archive
        </p>
      </section>

      {/* How it works */}
      <section className="px-6 py-20 bg-white dark:bg-gray-900">
        <div className="mx-auto max-w-4xl">
          <h2 className="text-center text-3xl font-bold tracking-tight sm:text-4xl">
            How it works
          </h2>

          <div className="mt-14 grid gap-10 sm:grid-cols-3">
            {steps.map((step) => (
              <div key={step.number} className="flex flex-col items-center text-center">
                <span className="flex h-12 w-12 items-center justify-center rounded-full bg-blue-600 text-lg font-bold text-white">
                  {step.number}
                </span>
                <h3 className="mt-4 text-lg font-semibold">{step.title}</h3>
                <p className="mt-2 text-sm text-gray-600 dark:text-gray-400">
                  {step.description}
                </p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Features */}
      <section className="px-6 py-20 bg-gray-50 dark:bg-gray-950">
        <div className="mx-auto max-w-5xl">
          <h2 className="text-center text-3xl font-bold tracking-tight sm:text-4xl">
            Features
          </h2>

          <div className="mt-14 grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
            {features.map((feature) => (
              <div
                key={feature.title}
                className="rounded-xl border border-gray-200 bg-white p-6 dark:border-gray-800 dark:bg-gray-900"
              >
                <h3 className="text-base font-semibold">{feature.title}</h3>
                <p className="mt-2 text-sm leading-relaxed text-gray-600 dark:text-gray-400">
                  {feature.description}
                </p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA Pro */}
      <section className="px-6 py-20 bg-white dark:bg-gray-900">
        <div className="mx-auto max-w-2xl rounded-2xl border border-gray-200 bg-gradient-to-br from-blue-50 to-white p-10 text-center dark:border-gray-800 dark:from-blue-950/30 dark:to-gray-900">
          <h2 className="text-2xl font-bold tracking-tight sm:text-3xl">
            This plugin is free.
            <br />
            Photo Toolbox Pro gives you more.
          </h2>

          <ul className="mt-8 space-y-3 text-left inline-block">
            {proFeatures.map((feature) => (
              <li key={feature} className="flex items-start gap-3">
                <CheckIcon />
                <span className="text-gray-700 dark:text-gray-300">{feature}</span>
              </li>
            ))}
          </ul>

          <div className="mt-10">
            <a
              href="/pricing"
              className="inline-flex items-center gap-2 rounded-lg bg-gray-900 px-8 py-3.5 text-lg font-semibold text-white shadow transition hover:bg-gray-800 dark:bg-white dark:text-gray-900 dark:hover:bg-gray-100"
            >
              Get Photo Toolbox Pro — €4.99/month
            </a>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-gray-200 bg-gray-50 px-6 py-10 dark:border-gray-800 dark:bg-gray-950">
        <div className="mx-auto max-w-3xl text-center text-sm text-gray-500 dark:text-gray-500">
          <p>
            Plugin version {PLUGIN_VERSION} &middot; Compatible with Lightroom
            Classic 6.0+
          </p>

          <p className="mt-4 font-mono text-xs break-all">
            SHA256: {SHA256}
          </p>

          <div className="mt-6 flex flex-wrap items-center justify-center gap-4">
            <a
              href={DOWNLOAD_URL}
              className="font-medium text-blue-600 underline-offset-4 hover:underline dark:text-blue-400"
            >
              Download v{PLUGIN_VERSION}
            </a>
            <span className="text-gray-300 dark:text-gray-700">&middot;</span>
            <a
              href="https://github.com/adrienlac69/lr-classic-webp#installation"
              className="font-medium text-blue-600 underline-offset-4 hover:underline dark:text-blue-400"
            >
              Installation guide
            </a>
            <span className="text-gray-300 dark:text-gray-700">&middot;</span>
            <a
              href="https://github.com/adrienlac69/lr-classic-webp"
              className="font-medium text-blue-600 underline-offset-4 hover:underline dark:text-blue-400"
            >
              Source on GitHub
            </a>
          </div>
        </div>
      </footer>
    </div>
  );
}

function DownloadIcon() {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="20"
      height="20"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden="true"
    >
      <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4" />
      <polyline points="7 10 12 15 17 10" />
      <line x1="12" y1="15" x2="12" y2="3" />
    </svg>
  );
}

function CheckIcon() {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="20"
      height="20"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
      className="mt-0.5 shrink-0 text-blue-600 dark:text-blue-400"
      aria-hidden="true"
    >
      <polyline points="20 6 9 17 4 12" />
    </svg>
  );
}
