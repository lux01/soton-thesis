$out_dir = "build";
$pdf_mode = "1";
$pdflatex = "xelatex -file-line-error -synctex=1 -interaction=batchmode -shell-escape %O %S";
$silent = "0";
$preview_mode = "0";

# # Custom dependency and function for makeidx package
# add_cus_dep('idx', 'ind', 0, 'makeidx');
# sub makeidx {
#     system("makeindex \"$_[0].idx\" -s \"$_[0].ist\" -o \"$_[0].ind\"");
# }

# add_cus_dep('glo', 'gls', 0, 'makeglossary');
# add_cus_dep('acn', 'acr', 0, 'makeglossary');
# sub makeglossary {
#     system("makeglossaries -d \"$out_dir\" \"$_[0]\"");
# }

add_cus_dep('glo', 'gls', 0, 'makeglossary');
sub makeglossary {
    system("xindy -L english -C utf8 -I xindy -M \"$_[0]\" -t \"$_[0].glg\" -o \"$_[0].gls\" \"$_[0]\".glo");
}

add_cus_dep('acn', 'acr', 0, 'makeacronym');
sub makeacronym {
    system("xindy -L english -C utf8 -I xindy -M \"$_[0]\" -t \"$_[0].acg\" -o \"$_[0].acr\" \"$_[0]\".acn");
}

# # Custom dependency and function for nomencl package
# add_cus_dep('nlo', 'nls', 0, 'nomenclature');
# sub nomenclature {
#     system("makeindex \"$_[0].nlo\" -s nomencl.ist -o \"$_[0].nls\"");
# }

push @generated_exts, 'glo', 'gls', 'glg', 'acn', 'acg', 'acr', 'xdy', 'glsdefs', 'auxlock', 'brf';

# push @generated_exts, 'glo', 'gls', 'glg';
# push @generated_exts, 'acn', 'acr', 'alg';
# push @generated_exts, 'idx', 'ind', 'ilg';
# push @generated_exts, 'nlo', 'nls';
