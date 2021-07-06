$lualatex = 'lualatex -shell-escape -file-line-error --halt-on-error --interaction=nonstopmode --synctex=-1 %O %S';
$out_dir = 'build';

$pdf_mode = 4;

@default_files = ('main.tex');
@generated_exts = qw(acn acr alg aux code ist fls glg glo gls glsdefs idx ind lof lot out thm toc tpt wrt);

add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');
add_cus_dep('ntn', 'not', 0, 'run_makeglossaries');
add_cus_dep('stn', 'sot', 0, 'run_makeglossaries');

sub run_makeglossaries {
  if ( $silent ) {
    system "makeglossaries", "-q", $_[0];
  }
  else {
    system "makeglossaries", $_[0];
  };
}

$clean_ext .= ' %R.ist %R.xdy';
