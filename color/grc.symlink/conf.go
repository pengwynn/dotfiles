
# RUN
regexp==== RUN (.*)
colours=black
count=more
===
# PASS
regexp=(.*)PASS:?(.*)
colours=green
count=more
=====
# FAIL
regexp=(.*)FAIL:?(.*)
colours=red
count=more
=====
# SKIP
regexp=(.*)SKIP:?(.*)
colours=yellow
count=more
