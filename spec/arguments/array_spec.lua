local util = require("spec.util")

describe("array argument", function()
   it("catches error in array elements", util.check_type_error([[
      local function a(arg: {string})
         print(arg)
      end

      function main()
         a({"a", 100})
         a(100)
      end
   ]], {
      { y = 6, msg = 'argument 1: got {string | number}, expected {string}' },
      { y = 7, msg = 'argument 1: got number, expected {string}' },
   }))
end)
