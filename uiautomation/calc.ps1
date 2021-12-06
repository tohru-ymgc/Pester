Import-Module "UIAutomation.dllが格納されているパス先を指定"
[UIAutomation.Preferences]::Highlight=$false
function click_numbutton_one {
    $wndw = Get-UiaWindow -Name '電卓'　# 対象のアプリを指定する
    $wndw | Get-UiaButton -AutomationId 'num1Button' | Invoke-UiaButtonClick | Out-Null　#電卓の[1]ボタンを指定し、クリックする
    $wndw | Get-UiaText -AutomationID 'CalculatorResults' | Read-UIAControlName　#電卓の計算結果表示エリアに表示されている数値を取得する
}
