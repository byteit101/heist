program [[:define, :quit, :exit], [:define, [:newline], [:display, "\n"]], [:define, [:force, :promise], [:promise]], [:define, :"call/cc", :"call-with-current-continuation"], [:define, [:not, :x], [:if, :x, false, true]], [:define, :true, true], [:define, :false, false], [:define, [:boolean?, :x], [:or, [:eqv?, :x, true], [:eqv?, :x, false]]], [:define, :number?, :complex?], [:define, [:zero?, :x], [:eqv?, :x, 0]], [:define, [:positive?, :x], [:>, :x, 0]], [:define, [:negative?, :x], [:<, :x, 0]], [:define, [:odd?, :x], [:"=", 1, [:abs, [:remainder, :x, 2]]]], [:define, [:even?, :x], [:zero?, [:remainder, :x, 2]]], [:define, [:max, :".", :values], [:foldr, [:lambda, [:a, :b], [:if, [:>=, :a, :b], :a, :b]], [:car, :values], [:cdr, :values]]], [:define, [:min, :".", :values], [:foldr, [:lambda, [:a, :b], [:if, [:<=, :a, :b], :a, :b]], [:car, :values], [:cdr, :values]]], [:define, [:abs, :x], [:if, [:negative?, :x], [:-, :x], :x]], [:define, [:quotient, :x, :y], [:let, [[:result, [:/, :x, :y]]], [[:if, [:positive?, :result], :floor, :ceiling], :result]]], [:define, [:remainder, :x, :y], [:-, [:round, :x], [:*, [:round, :y], [:quotient, :x, :y]]]], [:define, [:modulo, :x, :y], [:+, [:remainder, :x, :y], [:if, [:negative?, [:*, :x, :y]], [:round, :y], 0]]], [:define, [:gcd, :x, :y, :".", :rest], [:if, [:null?, :rest], [:if, [:zero?, :y], [:abs, :x], [:gcd, :y, [:remainder, :x, :y]]], [:apply, :gcd, [:cons, [:gcd, :x, :y], :rest]]]], [:define, [:lcm, :x, :y, :".", :rest], [:if, [:null?, :rest], [:/, [:abs, [:*, :x, :y]], [:gcd, :x, :y]], [:apply, :lcm, [:cons, [:lcm, :x, :y], :rest]]]], [:define, :ceiling, :ceil], [:define, [:rationalize, :x, :tolerance], [:cond, [[:rational?, :x], :x], [[:not, [:zero?, [:"imag-part", :x]]], [:"make-rectangular", [:rationalize, [:"real-part", :x], :tolerance], [:rationalize, [:"imag-part", :x], :tolerance]]], [:else, [:"let*", [[:t, [:abs, :tolerance]], [:a, [:-, :x, :t]], [:b, [:+, :x, :t]]], [:do, [[:i, 1, [:+, :i, 1]], [:z, false]], [[:number?, :z], :z], [:let, [[:p, [:ceiling, [:*, :a, :i]]], [:q, [:floor, [:*, :b, :i]]]], [:if, [:<=, :p, :q], [:set!, :z, [:/, [:if, [:positive?, :p], :p, :q], :i]]]]]]]]], [:define, [:"make-polar", :magnitude, :angle], [:let, [[:re, [:*, :magnitude, [:cos, :angle]]], [:im, [:*, :magnitude, [:sin, :angle]]]], [:"make-rectangular", :re, :im]]], [:define, [:magnitude, :z], [:let, [[:re, [:"real-part", :z]], [:im, [:"imag-part", :z]]], [:sqrt, [:+, [:*, :re, :re], [:*, :im, :im]]]]], [:define, [:angle, :z], [:let, [[:re, [:"real-part", :z]], [:im, [:"imag-part", :z]]], [:atan, :im, :re]]], [:define, [:factorial, :x], [:define, [:iter, :y, :acc], [:if, [:zero?, :y], :acc, [:iter, [:-, :y, 1], [:*, :y, :acc]]]], [:iter, :x, 1]], [:define, [:null?, :object], [:eqv?, [:quote, []], :object]], [:define, [:list?, :object], [:or, [:null?, :object], [:and, [:pair?, :object], [:list?, [:cdr, :object]]]]], [:define, [:list, :".", :args], :args], [:define, [:length, :object], [:define, [:iter, :list, :acc], [:if, [:null?, :list], :acc, [:iter, [:cdr, :list], [:+, 1, :acc]]]], [:iter, :object, 0]], [:define, [:append, :first, :".", :rest], [:cond, [[:null?, :rest], :first], [[:null?, :first], [:apply, :append, :rest]], [:else, [:cons, [:car, :first], [:append, [:cdr, :first], [:apply, :append, :rest]]]]]], [:define, [:reverse, :object], [:if, [:null?, :object], :object, [:append, [:reverse, [:cdr, :object]], [:list, [:car, :object]]]]], [:define, [:"list-tail", :list, :k], [:do, [[:pair, :list, [:cdr, :pair]], [:i, :k, [:-, :i, 1]]], [[:zero?, :i], :pair]]], [:define, [:"list-ref", :list, :k], [:car, [:"list-tail", :list, :k]]], [:define, [:"list-transform-search", :transform], [:lambda, [:predicate], [:lambda, [:object, :list], [:do, [[:pair, :list, [:cdr, :pair]]], [[:or, [:null?, :pair], [:predicate, [:car, [:transform, :pair]], :object]], [:if, [:null?, :pair], false, [:transform, :pair]]]]]]], [:define, :"list-search", [:"list-transform-search", [:lambda, [:x], :x]]], [:define, :memq, [:"list-search", :eq?]], [:define, :memv, [:"list-search", :eqv?]], [:define, :member, [:"list-search", :equal?]], [:define, :"assoc-list-search", [:"list-transform-search", :car]], [:define, :assq, [:"assoc-list-search", :eq?]], [:define, :assv, [:"assoc-list-search", :eqv?]], [:define, :assoc, [:"assoc-list-search", :equal?]], [:define, [:map, :proc, :list1, :".", :list2], [:if, [:null?, :list1], :list1, [:if, [:null?, :list2], [:cons, [:proc, [:car, :list1]], [:map, :proc, [:cdr, :list1]]], [:"let*", [[:all, [:cons, :list1, :list2]], [:args, [:map, :car, :all]], [:rest, [:map, :cdr, :all]]], [:cons, [:apply, :proc, :args], [:apply, :map, [:cons, :proc, :rest]]]]]]], [:define, [:"for-each", :proc, :list1, :".", :list2], [:do, [[:pair, :list1, [:cdr, :pair]], [:others, :list2, [:map, :cdr, :others]]], [[:null?, :pair], [:quote, []]], [:apply, :proc, [:cons, [:car, :pair], [:map, :car, :others]]]]], [:define, [:foldr, :proc, :value, :list], [:if, [:null?, :list], :value, [:proc, [:car, :list], [:foldr, :proc, :value, [:cdr, :list]]]]], [:define, [:sublist, :list, :start, :end], [:cond, [[:null?, :list], [:quote, []]], [[:>, :start, 0], [:sublist, [:cdr, :list], [:-, :start, 1], [:-, :end, 1]]], [[:<=, :end, 0], [:quote, []]], [:else, [:cons, [:car, :list], [:sublist, [:cdr, :list], 0, [:-, :end, 1]]]]]], [:define, [:char, :string], [:if, [:and, [:string?, :string], [:"=", [:"string-length", :string], 1]], [:"string-ref", :string, 0], [:quote, []]]], [:define, [:"char-upper-case?", :letter], [:and, [:char?, :letter], [:let, [[:code, [:"char->integer", :letter]]], [:and, [:>=, :code, 65], [:<=, :code, 90]]]]], [:define, [:"char-lower-case?", :letter], [:and, [:char?, :letter], [:let, [[:code, [:"char->integer", :letter]]], [:and, [:>=, :code, 97], [:<=, :code, 122]]]]], [:define, [:"char-alphabetic?", :char], [:or, [:"char-upper-case?", :char], [:"char-lower-case?", :char]]], [:define, [:"char-numeric?", :char], [:and, [:char?, :char], [:let, [[:code, [:"char->integer", :char]]], [:and, [:>=, :code, 48], [:<=, :code, 57]]]]], [:define, [:"char-whitespace?", :char], [:and, [:char?, :char], [:if, [:member, [:"char->integer", :char], [:quote, [9, 10, 32]]], true, false]]], [:define, [:"char-upcase", :char], [:let, [[:code, [:"char->integer", :char]]], [:if, [:and, [:>=, :code, 97], [:<=, :code, 122]], [:"integer->char", [:-, :code, 32]], [:"integer->char", :code]]]], [:define, [:"char-downcase", :char], [:let, [[:code, [:"char->integer", :char]]], [:if, [:and, [:>=, :code, 65], [:<=, :code, 90]], [:"integer->char", [:+, :code, 32]], [:"integer->char", :code]]]], [:define, [:"char-compare-ci", :operator], [:lambda, [:x, :y], [:operator, [:"char-downcase", :x], [:"char-downcase", :y]]]], [:define, :"char-ci=?", [:"char-compare-ci", :"char=?"]], [:define, :"char-ci<?", [:"char-compare-ci", :"char<?"]], [:define, :"char-ci>?", [:"char-compare-ci", :"char>?"]], [:define, :"char-ci<=?", [:"char-compare-ci", :"char<=?"]], [:define, :"char-ci>=?", [:"char-compare-ci", :"char>=?"]], [:define, [:string, :".", :chars], [:"list->string", :chars]], [:define, [:"string-compare", :string1, :string2, :"char-less?", :"char-greater?"], [:if, [:or, [:not, [:string?, :string1]], [:not, [:string?, :string2]]], [:error, "Expected two strings as arguments"], [:do, [[:pair1, [:"string->list", :string1], [:cdr, :pair1]], [:pair2, [:"string->list", :string2], [:cdr, :pair2]], [:diff, [:quote, []]]], [[:integer?, :diff], :diff], [:set!, :diff, [:cond, [[:null?, :pair1], [:if, [:null?, :pair2], 0, -1]], [[:null?, :pair2], 1], [:else, [:let, [[:char1, [:car, :pair1]], [:char2, [:car, :pair2]]], [:cond, [[:"char-less?", :char1, :char2], -1], [[:"char-greater?", :char1, :char2], 1], [:else, [:quote, []]]]]]]]]]], [:define, [:"string=?", :string1, :string2], [:zero?, [:"string-compare", :string1, :string2, :"char<?", :"char>?"]]], [:define, [:"string-ci=?", :string1, :string2], [:zero?, [:"string-compare", :string1, :string2, :"char-ci<?", :"char-ci>?"]]], [:define, [:"string<?", :string1, :string2], [:"=", [:"string-compare", :string1, :string2, :"char<?", :"char>?"], -1]], [:define, [:"string>?", :string1, :string2], [:"=", [:"string-compare", :string1, :string2, :"char<?", :"char>?"], 1]], [:define, [:"string<=?", :string1, :string2], [:not, [:"string>?", :string1, :string2]]], [:define, [:"string>=?", :string1, :string2], [:not, [:"string<?", :string1, :string2]]], [:define, [:"string-ci<?", :string1, :string2], [:"=", [:"string-compare", :string1, :string2, :"char-ci<?", :"char-ci>?"], -1]], [:define, [:"string-ci>?", :string1, :string2], [:"=", [:"string-compare", :string1, :string2, :"char-ci<?", :"char-ci>?"], 1]], [:define, [:"string-ci<=?", :string1, :string2], [:not, [:"string-ci>?", :string1, :string2]]], [:define, [:"string-ci>=?", :string1, :string2], [:not, [:"string-ci<?", :string1, :string2]]], [:define, [:substring, :string, :start, :end], [:"list->string", [:sublist, [:"string->list", :string], :start, :end]]], [:define, [:"list->string", :chars], [:"let*", [[:size, [:length, :chars]], [:str, [:"make-string", :size]]], [:do, [[:list, :chars, [:cdr, :list]], [:i, 0, [:+, :i, 1]]], [[:"=", :i, :size], :str], [:"string-set!", :str, :i, [:car, :list]]]]], [:define, [:"string->list", :string], [:let, [[:size, [:"string-length", :string]]], [:do, [[:i, :size, [:-, :i, 1]], [:list, [:quote, []], [:cons, [:"string-ref", :string, [:-, :i, 1]], :list]]], [[:zero?, :i], :list]]]], [:define, [:"string-copy", :string], [:"list->string", [:"string->list", :string]]], [:define, [:"string-fill!", :string, :char], [:let, [[:size, [:"string-length", :string]]], [:do, [[:i, :size, [:-, :i, 1]]], [[:zero?, :i], :string], [:"string-set!", :string, [:-, :i, 1], :char]]]], [:define, [:"string-append", :".", :strings], [:"list->string", [:apply, :append, [:map, :"string->list", :strings]]]], [:define, [:vector, :".", :args], [:"list->vector", :args]], [:define, [:"list->vector", :list], [:"let*", [[:size, [:length, :list]], [:"new-vector", [:"make-vector", :size]]], [:do, [[:i, 0, [:+, :i, 1]], [:pair, :list, [:cdr, :pair]]], [[:"=", :i, :size], :"new-vector"], [:"vector-set!", :"new-vector", :i, [:car, :pair]]]]], [:define, [:"vector->list", :vector], [:do, [[:i, [:"vector-length", :vector], [:-, :i, 1]], [:pair, [:quote, []], [:cons, [:"vector-ref", :vector, [:-, :i, 1]], :pair]]], [[:zero?, :i], :pair]]], [:define, [:"vector-fill!", :vector, :fill], [:do, [[:i, [:"vector-length", :vector], [:-, :i, 1]]], [[:zero?, :i], :vector], [:"vector-set!", :vector, [:-, :i, 1], :fill]]]]