# Set up i18n variables
# export LANG=<ll>_<CC>.<charmap><@modifiers>
# export LANG=zh_CN.GBK for Chinese
# export LANG=zh_CN.GB2312 for Chinese
# export LANG=C
export LANG="zh_CN.UTF-8"
if [ $EUID -eq 0 ]; then
	export LANG=C
fi
[ "$TERM" = "linux" ] && export LC_ALL=C

