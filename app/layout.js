import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";
import AuthProvider from "./components/AuthProvider"; // Updated path
import { TranslationProvider } from "./hooks/useTranslation";
import { getServerSession } from "next-auth/next";
import { authOptions } from "./api/auth/[...nextauth]/route"; // Updated path

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata = {
  title: "WC Finder - Znajdź najbliższe WC",
  description: "Znajdź i oceniaj publiczne toalety w swojej okolicy",
};

export default async function RootLayout({ children }) {
  const session = await getServerSession(authOptions);

  return (
    <html lang="pl">
      <body className={`${geistSans.variable} ${geistMono.variable}`}>
        <TranslationProvider defaultLanguage="pl">
          <AuthProvider session={session}>{children}</AuthProvider>
        </TranslationProvider>
      </body>
    </html>
  );
}
