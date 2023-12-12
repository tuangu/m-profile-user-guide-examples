cd projects/m-profile/exception_model/interrupt-deprivileging

while getopts "f:t:k:" opt; do
    case "$opt" in
        f) FVP="$OPTARG";;
        t) TARMAC="$OPTARG";;
        k) KILLTIME="$OPTARG";;
    esac
done

$FVP/FVP_MPS2_Cortex-M55 -C fvp_mps2.DISABLE_GATING=1 -C cpu0.INITSVTOR=0x0  -C cpu0.semihosting-heap_base=0x0 -C cpu0.semihosting-heap_limit=0x0 -C cpu0.semihosting-stack_base=0x0 -C cpu0.semihosting-stack_limit=0x0 --stat -a logs/interrupt-deprivileging.axf --plugin $TARMAC -C TRACE.TarmacTrace.trace-file=logs/tarmac.log -T $KILLTIME