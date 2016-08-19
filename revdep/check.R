library("devtools")

res <- revdep_check(threads = 3)
revdep_check_save_summary()
