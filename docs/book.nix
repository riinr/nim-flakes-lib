let
  author    = "riinr";
  edit-path = "${org-url}/${project}/edit/master/docs/{path}";
  org-url   = "https://github.com/${author}";
  project   = "nim-flakes-lib";
in
{
  files.mdbook.authors      = ["RiiNR <${org-url}>"];
  files.mdbook.enable       = true;
  files.mdbook.gh-author    = author;
  files.mdbook.gh-project   = project;
  files.mdbook.language     = "en";
  files.mdbook.multilingual = false;
  files.mdbook.summary      = builtins.readFile ./summary.md;
  files.mdbook.title        = "Nim nix flake lib";
  files.mdbook.output.html.fold.enable = true;
  files.mdbook.output.html.edit-url-template   = edit-path;
  files.mdbook.output.html.git-repository-icon = "fa-github";
  files.mdbook.output.html.git-repository-url  = "${org-url}/${project}";
  files.mdbook.output.html.no-section-label    = true;
  files.mdbook.output.html.site-url            = "/${project}/";

  files.text."/gh-pages/src/about.md"    = builtins.readFile ./about.md;
  files.text."/gh-pages/src/see-also.md" = builtins.readFile ./see-also.md;
  files.text."/gh-pages/src/usage.md"    = builtins.readFile ./usage.md;
  files.docs."/gh-pages/src/nimcfg-options.md".modules = [ ../modules/nimcfg-options.nix ];
  files.gitignore.pattern."gh-pages" = true;
  gh-actions.gh-pages.build  = "publish-as-gh-pages";
  gh-actions.gh-pages.enable = true;
  gh-actions.gh-pages.cache.name       = "cruel-intentions";
}
