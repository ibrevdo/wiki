
# handle command line args

### if no arguments were provided

```bash
function USAGE ()
{
    echo ""
    echo "USAGE: "
    echo "    ineff.sh [-?dh]"
    echo ""
    echo "OPTIONS:"
    echo "    -d  date of logfiles (format: yyyymmdd)"
    echo "    -h  logfile (format: 12 or 1[2-4])"
    echo "    -?  this usage information"
    echo ""
    echo "EXAMPLE:"
    echo "    ineff.sh -d 20060801 -h 2[12]"
    echo ""
    exit $E_OPTERROR    # Exit and explain usage, if no argument(s) given.
}
```

### process arguments
```bash
while getopts ":d:h:?" Option
do
    case $Option in
        d    ) DT=$OPTARG;;
        h    ) HR=$OPTARG;;
        ?    ) USAGE
               exit 0;;
        *    ) echo ""
               echo "Unimplemented option chosen."
               USAGE   # DEFAULT
    esac
done

shift $(($OPTIND - 1))
#  Decrements the argument pointer so it points to next argument.
#  $1 now references the first non option item supplied on the command line
#  if one exists.
```
