const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    // レイルズ側の送信処理を止めているのが、e.preventDefault();
    e.preventDefault();
// "charge-form"というidでフォームの情報を取得し、それをFormDataオブジェクトとして生成
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
// 生成したFormDataオブジェクトから、クレカの情報を取得し、変数cardに代入するオブジェクトとして定義
// ormData.get  name属性と一致するhtml要素の値を取りに行く
    const card = {
      number: formData.get("purchase_address[number]"),
      cvc: formData.get("purchase_address[cvc]"),
      exp_month: formData.get("purchase_address[exp_month]"),
      exp_year: `20${formData.get("purchase_address[exp_year]")}`,
    };
// createTokenメソッドの第一引数には、10〜15行目で定義したクレジットカード情報が入る
// 第二引数にはアロー関数を用いて、レスポンスを受け取ったあとの処理
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
  // トークンの値をフォームに含める。JavaScriptでinput要素を生成しフォームに加え、その値としてトークンをセット
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      // getElementByIdはid属性と一致するhtml要素を取りに行く
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);