$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "動作確認" {
    Start-Process calc
    It "電卓ボタン1を押下すると、結果表示が1になること" {
        click_numbutton_one| Should Be "表示は 1 です"
    }
    Stop-Process -name Calculator
}
