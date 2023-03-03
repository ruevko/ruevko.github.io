# check pkgs availability
for (pkg in c("rmarkdown", "pagedown", "postcards")) {
   if (pkg %in% installed.packages()[ , "Package"]) {
      message("{", pkg, "} available")
   } else {
      install.packages(c(pkg), quiet = TRUE)
      if (! pkg %in% installed.packages()[ , "Package"]) {
         stop("{", pkg, "} installation failed")
      }
      message("{", pkg, "} installed")
   }
}
# render home page
rmarkdown::render("index.rmd", output_dir = "docs")
# render resume page
rmarkdown::render("resume.rmd", output_dir = "docs")
# preview resume page
# xaringan::infinite_moon_reader("resume.rmd")
