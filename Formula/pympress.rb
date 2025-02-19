class Pympress < Formula
  include Language::Python::Virtualenv

  desc "Simple and powerful dual-screen PDF reader designed for presentations"
  homepage "https://github.com/Cimbali/pympress/"
  url "https://files.pythonhosted.org/packages/c0/65/041a4feb4d432edce8215703892eef5379d0d925c7f304332501c29ddfac/pympress-1.7.0.tar.gz"
  sha256 "0311f43f2016604108a90031f601b6798c973228cb64666a5e446195ddf689e1"
  license "GPL-2.0-or-later"
  head "https://github.com/Cimbali/pympress.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, big_sur:  "d6a7c28f5b145de3054cbfcfe94999ca1dd0401d01092da0b5a56bc9af72f504"
    sha256 cellar: :any_skip_relocation, catalina: "414c138633730609b93f975065f2528d63afae3cca4431479644b392b74a4f4b"
  end

  depends_on "gobject-introspection"
  depends_on "gst-plugins-bad"
  depends_on "gst-plugins-base"
  depends_on "gst-plugins-good"
  depends_on "gst-plugins-ugly"
  depends_on "gstreamer"
  depends_on "gtk+3"
  depends_on "libyaml"
  depends_on "poppler"
  depends_on "pygobject3"
  depends_on "python@3.9"

  resource "watchdog" do
    url "https://files.pythonhosted.org/packages/c5/e9/fb0f9775c82b4df1815bb97ebac13383adddff4cf014aceefb7c02262675/watchdog-2.1.5.tar.gz"
    sha256 "5563b005907613430ef3d4aaac9c78600dd5704e84764cb6deda4b3d72807f09"
  end

  def install
    virtualenv_install_with_resources
    bin.install_symlink libexec/"bin/pympress"
  end

  test do
    on_linux do
      # (pympress:48790): Gtk-WARNING **: 13:03:37.080: cannot open display
      return if ENV["HOMEBREW_GITHUB_ACTIONS"]
    end

    system bin/"pympress", "--quit"
  end
end
