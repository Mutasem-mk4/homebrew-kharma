class Procscope < Formula
  desc "eBPF process tracer for Linux malware triage and incident response"
  homepage "https://mutasem-mk4.github.io/procscope/"
  url "https://github.com/Mutasem-mk4/procscope/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "7efcd3b031115637b2bac1c2243786e2f6430445743ff42c5b5f7f680fa3d624"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"procscope", "./cmd/procscope"
    man1.install "man/procscope.1"
    bash_completion.install "completions/procscope.bash" => "procscope"
    zsh_completion.install "completions/procscope.zsh" => "_procscope"
    fish_completion.install "completions/procscope.fish"
  end

  test do
    system "#{bin}/procscope", "--version"
  end
end
