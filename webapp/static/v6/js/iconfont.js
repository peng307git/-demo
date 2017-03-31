;(function(window) {

  var svgSprite = '<svg>' +
    '' +
    '<symbol id="icon-icon-test10" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M514.633 886.066l-10.587-10.587-9.251 9.251-445.421-446.752 288.147-288.147 169.186 169.186 167.858-167.858 288.147 288.147-448.084 446.752zM504.062 838.489l10.587 10.587 409.724-409.724-249.826-249.826-167.858 167.858-169.186-169.186-249.826 249.826 409.724 409.724 6.61-9.251z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M681.437 177.599l25.517 6.911-178.62 659.575-25.517-6.911z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M343.482 178.802l178.62 659.575-25.517 6.911-178.62-659.575z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M855.648 439.307c0 29.205 23.674 52.865 52.865 52.865s52.865-23.674 52.865-52.865c0-29.205-23.674-52.865-52.865-52.865-29.205 0-52.865 23.674-52.865 52.865z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M908.529 505.39c-37.018 0-66.097-29.077-66.097-66.097s29.077-66.097 66.097-66.097 66.097 29.077 66.097 66.097-29.077 66.097-66.097 66.097zM908.529 399.629c-22.479 0-39.661 17.181-39.661 39.661s17.181 39.661 39.661 39.661 39.661-17.181 39.661-39.661-17.181-39.661-39.661-39.661z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M62.599 439.307c0 29.205 23.674 52.865 52.865 52.865s52.865-23.674 52.865-52.865c0-29.205-23.674-52.865-52.865-52.865-29.205 0-52.865 23.674-52.865 52.865z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M115.471 505.39c-37.018 0-66.097-29.077-66.097-66.097s29.077-66.097 66.097-66.097 66.097 29.077 66.097 66.097-29.077 66.097-66.097 66.097zM115.471 399.629c-22.479 0-39.661 17.181-39.661 39.661s17.181 39.661 39.661 39.661 39.661-17.181 39.661-39.661-17.181-39.661-39.661-39.661z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M459.135 849.038c0 29.205 23.674 52.865 52.865 52.865s52.865-23.674 52.865-52.865c0-29.205-23.674-52.865-52.865-52.865-29.205 0-52.865 23.674-52.865 52.865z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M512 915.135c-37.018 0-66.097-29.077-66.097-66.097s29.077-66.097 66.097-66.097 66.097 29.077 66.097 66.097-29.077 66.097-66.097 66.097zM512 809.387c-22.479 0-39.661 17.181-39.661 39.661s17.181 39.661 39.661 39.661 39.661-17.181 39.661-39.661-17.181-39.661-39.661-39.661z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M459.135 346.782c0 29.205 23.674 52.865 52.865 52.865s52.865-23.674 52.865-52.865c0-29.205-23.674-52.865-52.865-52.865-29.205 0-52.865 23.674-52.865 52.865z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M512 412.875c-37.018 0-66.097-29.077-66.097-66.097s29.077-66.097 66.097-66.097 66.097 29.077 66.097 66.097-29.077 66.097-66.097 66.097zM512 307.129c-22.479 0-39.661 17.181-39.661 39.661s17.181 39.661 39.661 39.661 39.661-17.181 39.661-39.661-17.181-39.661-39.661-39.661z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M287.313 174.962c0 29.205 23.674 52.865 52.865 52.865s52.865-23.674 52.865-52.865c0-29.205-23.674-52.865-52.865-52.865-29.205 0-52.865 23.674-52.865 52.865z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M340.171 241.040c-37.018 0-66.097-29.077-66.097-66.097s29.077-66.097 66.097-66.097 66.097 29.077 66.097 66.097-29.077 66.097-66.097 66.097zM340.171 135.291c-22.479 0-39.661 17.181-39.661 39.661s17.181 39.661 39.661 39.661 39.661-17.181 39.661-39.661-17.181-39.661-39.661-39.661z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M630.971 174.962c0 29.205 23.674 52.865 52.865 52.865s52.865-23.674 52.865-52.865c0-29.205-23.674-52.865-52.865-52.865-29.205 0-52.865 23.674-52.865 52.865z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M683.829 241.040c-37.018 0-66.097-29.077-66.097-66.097s29.077-66.097 66.097-66.097 66.097 29.077 66.097 66.097-29.077 66.097-66.097 66.097zM683.829 135.291c-22.479 0-39.661 17.181-39.661 39.661s17.181 39.661 39.661 39.661 39.661-17.181 39.661-39.661-17.181-39.661-39.661-39.661z" fill="#238BF6" ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-icon-test11" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M512 949.039c-241.1 0-437.039-195.975-437.039-437.039s195.975-437.039 437.039-437.039 437.039 195.975 437.039 437.039-195.975 437.039-437.039 437.039zM512 103.139c-225.602 0-408.861 183.284-408.861 408.861s183.284 408.861 408.861 408.861 408.861-183.284 408.861-408.861-183.284-408.861-408.861-408.861z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M520.467 751.666l-235.444-235.444 235.444-235.444 235.444 235.444-235.444 235.444zM324.483 516.225l195.975 195.975 195.975-195.975-195.975-195.975-195.975 195.975z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M455.611 328.716c0 31.152 25.252 56.389 56.389 56.389s56.389-25.252 56.389-56.389c0-31.152-25.252-56.389-56.389-56.389-31.152 0-56.389 25.252-56.389 56.389z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M512 399.218c-39.486 0-70.503-31.015-70.503-70.503s31.015-70.503 70.503-70.503 70.503 31.015 70.503 70.503-31.015 70.503-70.503 70.503zM512 286.398c-23.978 0-42.305 18.326-42.305 42.305s18.326 42.305 42.305 42.305 42.305-18.326 42.305-42.305-18.326-42.305-42.305-42.305z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M455.611 695.284c0 31.152 25.252 56.389 56.389 56.389s56.389-25.252 56.389-56.389c0-31.152-25.252-56.389-56.389-56.389-31.152 0-56.389 25.252-56.389 56.389z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M512 765.758c-39.486 0-70.503-31.015-70.503-70.503s31.015-70.503 70.503-70.503 70.503 31.015 70.503 70.503-31.015 70.503-70.503 70.503zM512 652.993c-23.978 0-42.305 18.326-42.305 42.305s18.326 42.305 42.305 42.305 42.305-18.326 42.305-42.305-18.326-42.305-42.305-42.305z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M638.902 512c0 31.152 25.252 56.389 56.389 56.389s56.389-25.252 56.389-56.389c0-31.152-25.252-56.389-56.389-56.389-31.152 0-56.389 25.252-56.389 56.389z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M695.284 582.503c-39.486 0-70.503-31.015-70.503-70.503s31.015-70.503 70.503-70.503 70.503 31.015 70.503 70.503-31.015 70.503-70.503 70.503zM695.284 469.695c-23.978 0-42.305 18.326-42.305 42.305s18.326 42.305 42.305 42.305 42.305-18.326 42.305-42.305-18.326-42.305-42.305-42.305z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M286.398 512c0 31.152 25.252 56.389 56.389 56.389s56.389-25.252 56.389-56.389c0-31.152-25.252-56.389-56.389-56.389-31.152 0-56.389 25.252-56.389 56.389z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M342.814 582.503c-39.486 0-70.503-31.015-70.503-70.503s31.015-70.503 70.503-70.503 70.503 31.015 70.503 70.503-31.015 70.503-70.503 70.503zM342.814 469.695c-23.978 0-42.305 18.326-42.305 42.305s18.326 42.305 42.305 42.305 42.305-18.326 42.305-42.305-18.326-42.305-42.305-42.305z" fill="#238BF6" ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-icon-test12" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M512 948.169c-2.633 0-3.961 0-6.61-1.343l-343.648-198.283c-3.961-2.633-6.61-6.61-6.61-11.892v-396.529c0-5.283 2.633-9.251 6.61-11.892l343.648-198.283c3.961-2.633 9.251-2.633 13.22 0l343.648 198.283c3.961 2.633 6.61 6.61 6.61 11.892v396.529c0 5.283-2.633 9.251-6.61 11.892l-343.648 198.283c-2.633 1.343-3.961 1.343-6.61 1.343zM181.55 728.775l330.45 190.332 330.45-190.332v-380.669l-330.45-190.332-330.45 190.332v380.669z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M472.339 699.686l-54.203-239.235-25.123 95.162-13.22 9.251h-224.687v-26.42h214.128l37.018-136.135 26.42 1.343 50.213 224.687 55.534-330.45h26.42l58.159 305.328 35.694-70.054 11.892-7.938h185.041v26.42h-177.099l-48.908 97.815-25.123-2.633-51.556-270.96-54.203 323.818z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M459.135 141.91c0 29.205 23.674 52.865 52.865 52.865s52.865-23.674 52.865-52.865c0-29.205-23.674-52.865-52.865-52.865-29.205 0-52.865 23.674-52.865 52.865z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M512 207.991c-37.018 0-66.097-29.077-66.097-66.097s29.077-66.097 66.097-66.097 66.097 29.077 66.097 66.097-29.077 66.097-66.097 66.097zM512 102.276c-22.479 0-39.661 17.181-39.661 39.661s17.181 39.661 39.661 39.661 39.661-17.181 39.661-39.661-17.181-39.661-39.661-39.661z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M802.791 723.502c0 29.205 23.674 52.865 52.865 52.865s52.865-23.674 52.865-52.865c0-29.205-23.674-52.865-52.865-52.865-29.205 0-52.865 23.674-52.865 52.865z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M855.648 789.545c-37.018 0-66.097-29.077-66.097-66.097s29.077-66.097 66.097-66.097 66.097 29.077 66.097 66.097-29.077 66.097-66.097 66.097zM855.648 683.829c-22.479 0-39.661 17.181-39.661 39.661s17.181 39.661 39.661 39.661 39.661-17.181 39.661-39.661-17.181-39.661-39.661-39.661z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M115.471 723.502c0 29.205 23.674 52.865 52.865 52.865s52.865-23.674 52.865-52.865c0-29.205-23.674-52.865-52.865-52.865-29.205 0-52.865 23.674-52.865 52.865z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M168.352 789.545c-37.018 0-66.097-29.077-66.097-66.097s29.077-66.097 66.097-66.097 66.097 29.077 66.097 66.097-29.077 66.097-66.097 66.097zM168.352 683.829c-22.479 0-39.661 17.181-39.661 39.661s17.181 39.661 39.661 39.661 39.661-17.181 39.661-39.661-17.181-39.661-39.661-39.661z" fill="#238BF6" ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-icon-test13" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M737.602 226.271c0 33.229 26.935 60.148 60.148 60.148s60.148-26.935 60.148-60.148c0-33.229-26.935-60.148-60.148-60.148-33.229 0-60.148 26.935-60.148 60.148z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M797.729 301.465c-42.118 0-75.203-33.083-75.203-75.203s33.083-75.203 75.203-75.203 75.203 33.083 75.203 75.203-33.083 75.203-75.203 75.203zM797.729 181.145c-25.577 0-45.125 19.548-45.125 45.125s19.548 45.125 45.125 45.125 45.125-19.548 45.125-45.125-19.548-45.125-45.125-45.125z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M166.106 226.271c0 33.229 26.935 60.148 60.148 60.148s60.148-26.935 60.148-60.148c0-33.229-26.935-60.148-60.148-60.148-33.229 0-60.148 26.935-60.148 60.148z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M226.271 301.465c-42.118 0-75.203-33.083-75.203-75.203s33.083-75.203 75.203-75.203 75.203 33.083 75.203 75.203-33.083 75.203-75.203 75.203zM226.271 181.145c-25.577 0-45.125 19.548-45.125 45.125s19.548 45.125 45.125 45.125 45.125-19.548 45.125-45.125-19.548-45.125-45.125-45.125z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M737.602 797.729c0 33.229 26.935 60.148 60.148 60.148s60.148-26.935 60.148-60.148c0-33.229-26.935-60.148-60.148-60.148-33.229 0-60.148 26.935-60.148 60.148z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M797.729 872.918c-42.118 0-75.203-33.083-75.203-75.203s33.083-75.203 75.203-75.203 75.203 33.083 75.203 75.203-33.083 75.203-75.203 75.203zM797.729 752.642c-25.577 0-45.125 19.548-45.125 45.125s19.548 45.125 45.125 45.125 45.125-19.548 45.125-45.125-19.548-45.125-45.125-45.125z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M166.106 797.729c0 33.229 26.935 60.148 60.148 60.148s60.148-26.935 60.148-60.148c0-33.229-26.935-60.148-60.148-60.148-33.229 0-60.148 26.935-60.148 60.148z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M226.271 872.918c-42.118 0-75.203-33.083-75.203-75.203s33.083-75.203 75.203-75.203 75.203 33.083 75.203 75.203-33.083 75.203-75.203 75.203zM226.271 752.642c-25.577 0-45.125 19.548-45.125 45.125s19.548 45.125 45.125 45.125 45.125-19.548 45.125-45.125-19.548-45.125-45.125-45.125z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M744.319 262.668l21.259 21.259-476.398 476.398-21.259-21.259z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M278.685 262.439l476.398 476.398-21.259 21.276-476.398-476.398z" fill="#238BF6" ></path>' +
    '' +
    '<path d="M391.699 496.959c0 66.444 53.878 120.301 120.301 120.301s120.301-53.878 120.301-120.301c0-66.444-53.878-120.301-120.301-120.301-66.444 0-120.301 53.878-120.301 120.301z" fill="#DADEE9" ></path>' +
    '' +
    '<path d="M512 632.301c-75.203 0-135.362-60.148-135.362-135.362s60.148-135.362 135.362-135.362 135.362 60.148 135.362 135.362-60.148 135.362-135.362 135.362zM512 391.699c-58.659 0-105.273 46.607-105.273 105.273s46.607 105.273 105.273 105.273 105.273-46.607 105.273-105.273-46.607-105.273-105.273-105.273z" fill="#238BF6" ></path>' +
    '' +
    '</symbol>' +
    '' +
    '</svg>'
  var script = function() {
    var scripts = document.getElementsByTagName('script')
    return scripts[scripts.length - 1]
  }()
  var shouldInjectCss = script.getAttribute("data-injectcss")

  /**
   * document ready
   */
  var ready = function(fn) {
    if (document.addEventListener) {
      if (~["complete", "loaded", "interactive"].indexOf(document.readyState)) {
        setTimeout(fn, 0)
      } else {
        var loadFn = function() {
          document.removeEventListener("DOMContentLoaded", loadFn, false)
          fn()
        }
        document.addEventListener("DOMContentLoaded", loadFn, false)
      }
    } else if (document.attachEvent) {
      IEContentLoaded(window, fn)
    }

    function IEContentLoaded(w, fn) {
      var d = w.document,
        done = false,
        // only fire once
        init = function() {
          if (!done) {
            done = true
            fn()
          }
        }
        // polling for no errors
      var polling = function() {
        try {
          // throws errors until after ondocumentready
          d.documentElement.doScroll('left')
        } catch (e) {
          setTimeout(polling, 50)
          return
        }
        // no errors, fire

        init()
      };

      polling()
        // trying to always fire before onload
      d.onreadystatechange = function() {
        if (d.readyState == 'complete') {
          d.onreadystatechange = null
          init()
        }
      }
    }
  }

  /**
   * Insert el before target
   *
   * @param {Element} el
   * @param {Element} target
   */

  var before = function(el, target) {
    target.parentNode.insertBefore(el, target)
  }

  /**
   * Prepend el to target
   *
   * @param {Element} el
   * @param {Element} target
   */

  var prepend = function(el, target) {
    if (target.firstChild) {
      before(el, target.firstChild)
    } else {
      target.appendChild(el)
    }
  }

  function appendSvg() {
    var div, svg

    div = document.createElement('div')
    div.innerHTML = svgSprite
    svgSprite = null
    svg = div.getElementsByTagName('svg')[0]
    if (svg) {
      svg.setAttribute('aria-hidden', 'true')
      svg.style.position = 'absolute'
      svg.style.width = 0
      svg.style.height = 0
      svg.style.overflow = 'hidden'
      prepend(svg, document.body)
    }
  }

  if (shouldInjectCss && !window.__iconfont__svg__cssinject__) {
    window.__iconfont__svg__cssinject__ = true
    try {
      document.write("<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>");
    } catch (e) {
      console && console.log(e)
    }
  }

  ready(appendSvg)


})(window)