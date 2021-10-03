print.wr.test <- function(x, ...) {

  ci_level <- round((1 - x$alpha) * 100, 2)
  digit <- paste("%.", max(3, getOption("digits") - 4), "f", sep = "")
  digitp <- paste("%.", max(3, getOption("digits") - 3), "f", sep = "")

  display_p <- function(sv) {
    ifelse(as.numeric(sv) < 0.0001, "p-value < 0.0001", paste("p-value = ", sv, sep = ""))
  }

  wr1 <- sprintf(digit, x$wr1)
  wr2 <- sprintf(digit, x$wr2)
  # ci1 <- sprintf(digit, x$ci1)
  # ci2 <- sprintf(digit, x$ci2)
  ci1t <- sprintf(digit, x$ci1t)
  ci2t <- sprintf(digit, x$ci2t)

  mxo <- sprintf(digit, x$mxo)
  pvalmx <- display_p(sprintf(digitp, x$pvalmx))
  mxot <- sprintf(digit, x$mxot)
  pvalmxt <- display_p(sprintf(digitp, x$pvalmxt))

  chi <- sprintf(digit, x$chi)
  pvachi <- display_p(sprintf(digitp, x$pvachi))

  lin <- round(x$lin, 2)
  wrlin0 <- sprintf(digit, x$wrlin0)
  zvalin0 <- sprintf(digit, x$zvalin0)
  cilin0 <- sprintf(digit, x$cilin0)
  plin0 <- display_p(sprintf(digitp, x$plin0))

  lin_ar <- round(x$lin_ar, 2)
  wrlinl <- sprintf(digit, x$wrlinl)
  zvalint <- sprintf(digit, x$zvalint)
  cilint <- sprintf(digit, x$cilint)
  plintr <- display_p(sprintf(digitp, x$plintr))

  mxph <- sprintf(digit, x$mxph)
  pvalph <- display_p(sprintf(digitp, x$pvalph))
  zvaephl <- sprintf(digit, x$zvaephl)
  pvaephl <- display_p(sprintf(digitp, x$pvaephl))

  sum_table <- x$sum_table
  colnames(sum_table) <- c("Treatment", "Control", "All")
  rownames(sum_table) <- c("   H only", "   H & D", "   D only")

  cat("===================================================================================\n")
  cat("I. -------------- < Summary of Observed Events > --------------------------------\n\n")
  print(sum_table)
  cat("---------------------------------------------------------------------------------\n\n")

  cat("II. ------------- < Tests of the Global Null Hypothesis > -----------------------\n\n")
  cat(paste(" Maximum test*: test.stat = ", mxot, ", ", pvalmxt, sep = ""), "\n")
  cat("  *loglog transformation used\n\n")

  cat(paste(" Linear combination test*: test.stat = ", zvalin0, ", ", plin0, sep = ""), "\n")
  cat(paste("  *the input vector = (", lin[1], ", ", lin[2], ")", sep = ""),"\n\n")

  cat(paste(" Data-driven Linear combination test*: test.stat = ", zvalint, ", ", plintr, sep = ""), "\n")
  cat(paste("  *the data-driven vector = (", lin_ar[1], ", ", lin_ar[2], ")", sep = ""),"\n\n")

  cat(paste(" Chi-squre test: stat = ", chi, ", ", pvachi, sep = ""), "\n")
  cat("---------------------------------------------------------------------------------\n\n")

  cat(paste("III. ----------- < Confidence Intervals (", ci_level, "% CI) > ------------------------------", sep = ""), "\n\n")
  cat(paste(" Non-terminal event: win.ratio = ", wr1, ", CI = (", ci1t[1], ", ", ci1t[2], ")*", sep  =""), "\n")
  cat("  *loglog transformation used\n\n")

  cat(paste(" Terminal event: win.ratio = ", wr2, ", CI = (", ci2t[1], ", ", ci2t[2], ")*", sep  =""), "\n")
  cat("  *loglog transformation used\n\n")

  cat(paste(" Linear combination*: average win.ratio = ", wrlin0, ", CI = (", cilin0[1], ", ", cilin0[2], ")", sep  =""), "\n")
  cat(paste("  *the input vector = (", lin[1], ", ", lin[2], ")", sep = ""),"\n\n")

  cat(paste(" Data-driven Linear combination*: average win.ratio = ", wrlinl, ", CI = (", cilint[1], ", ", cilint[2], ")", sep  =""), "\n")
  cat(paste("  *the input vector = (", lin_ar[1], ", ", lin_ar[2], ")", sep = ""),"\n")
  cat("---------------------------------------------------------------------------------\n\n")

  cat("IV. ------------ < Test of Proportional Hazards > -------------------------------\n")
  cat(paste(" test.stat = ", mxph, ", ", pvalph, sep = ""), "\n")
  cat("---------------------------------------------------------------------------------\n\n")

  cat("V. ------------- < Test of Equal Hazard Ratios > --------------------------------\n")
  cat(paste(" test.stat = ", zvaephl, ", ", pvaephl, sep = ""), "\n")
  cat("---------------------------------------------------------------------------------\n")
  cat("===================================================================================\n")

}
