function CRAN(handle)
    local output = '<span class="cran-pkg"><a href="https://cran.r-project.org/package=' .. 
    pandoc.utils.stringify(handle) .. '">'.. 
    pandoc.utils.stringify(handle)..'</a><i class="fa-brands fa-r-project fa-2xs"></i></span>'
    return pandoc.RawBlock('html', output)
  end
  