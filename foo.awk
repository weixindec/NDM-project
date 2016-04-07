#Usage: awk -f foo.awk dict.dat user.dat



NR == FNR {
  rep[$1] = $2
  next
} 

{
    for (key in rep) {
      gsub(key, rep[key])
    }
    print
}
