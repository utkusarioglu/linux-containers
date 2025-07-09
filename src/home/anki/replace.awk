{
  gsub(/&/, "\&amp;");
  gsub(/</, "\&lt;");
  gsub(/>/, "\&gt;");
  gsub(/\\/, "\\\\");
  gsub(/\${/, "\\${");
  gsub(/`/, "\\`");
  print;
}
