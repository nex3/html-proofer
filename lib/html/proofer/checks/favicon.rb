# encoding: utf-8

class Favicon < ::HTML::Proofer::Checkable
  def rel
    @rel
  end
end

class Favicons < ::HTML::Proofer::Checks::Check

  def run
    return unless @options[:favicon]

    @html.css("link").each do |favicon|
      favicon = Favicon.new favicon, "favicon", self
      next if favicon.ignore?
      return if favicon.rel.split(" ").last.eql? "icon"
    end

    self.add_issue "no favicon specified"
  end

end
