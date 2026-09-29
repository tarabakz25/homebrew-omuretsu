class Omuretsu < Formula
  desc "Timeline time-memo TUI and CLI"
  homepage "https://github.com/tarabakz25/omuretsu"
  url "https://github.com/tarabakz25/omuretsu/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f9347d9a7aeb26a9623dc9021f56ae5526a959bcb47d806eef80011e4b4dc8a8"
  version "0.1.0"
  head "https://github.com/tarabakz25/omuretsu.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    db = testpath/"omuretsu.db"
    system bin/"omr", "--db", db, "add", "brew-test"
    assert_match "brew-test", shell_output("#{bin}/omr --db #{db} ls")
    assert_equal db.to_s, shell_output("#{bin}/omr --db #{db} path").strip
  end
end
