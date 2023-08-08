```bash
snippet = "==="
=== ${1}
endsnippet

snippet A "Array"
Array<${1}>${2}
endsnippet

snippet S "String"
String(${1})
endsnippet

snippet N "Number"
Number(${1})
endsnippet

snippet B "Boolean"
Boolean(${1})
endsnippet

snippet acl "abstract class"
abstract class ${1} {
	${2}
}
endsnippet

snippet b "boolean"
boolean${1}
endsnippet

snippet c "const"
const ${1}
endsnippet

snippet d "default"
default ${1}
endsnippet

snippet ee "expect"
expect(${1})
endsnippet

snippet ca "callback - array"
(${1}) => [
	${2}
]
endsnippet

snippet cb "callback"
(${1}) => {
	${2}
}
endsnippet

snippet cc "console.log"
// @#$
// eslint-disable-next-line no-console
console.log('${1}')
endsnippet

snippet cl "class"
class ${1} {
	${2}
}
endsnippet

snippet cn "callback - simple"
(${1}) => ${2}
endsnippet

snippet co "component"
component${1}
endsnippet

snippet cv "callback - value"
(${1}) => ({
	${2}
})
endsnippet

snippet de "describe"
describe('${1}', () => {
	${2}
})
endsnippet

snippet e "export"
export ${1}
endsnippet

snippet ed "export default"
export default ${1}
endsnippet

snippet f "function"
function ${1}(${2}) {
	${3}
}
endsnippet

snippet i "interface"
interface ${1} {
	${2}
}
endsnippet

snippet if "if"
if (${1}) {
	${2}
}
endsnippet

snippet im "import mount"
import { mount } from 'enzyme'
import 'jsdom-global/register'
endsnippet

snippet ir "import react"
import React from 'react'
endsnippet

snippet is "import shallow"
import { shallow } from 'enzyme'
endsnippet

snippet l "let"
let ${1}
endsnippet

snippet mi "mock implementstion"
mockImplementation(${1})
endsnippet

snippet n "number"
number${1}
endsnippet

snippet P "promise"
Promise<${1}>${2}
endsnippet

snippet psf "public static function"
public static ${1}() {
	${2}
}
endsnippet

snippet psr "public static readonly"
public static readonly ${1}
endsnippet

snippet r "return"
return ${1}
endsnippet

snippet re "readonly"
readonly ${1}
endsnippet

snippet si "set interval"
setInterval(() => {
	${2}
}, ${1})
endsnippet

snippet st "set timeout"
setTimeout(() => {
	${2}
}, ${1})
endsnippet

snippet ti "ts ignore"
// @ts-ignore
endsnippet

snippet ue "use effect"
useEffect(() => {
	${2}
}, [${1}])
endsnippet

snippet us "use state"
const [${1}, set${2}] = useState<${3}>(${4});
endsnippet

snippet s "string"
string${1}
endsnippet

snippet y "yield"
yield ${1}
endsnippet
```
