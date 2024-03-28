<template>
  <div>
    <table class="contents-table">
      <tr>
        <th>衣類選択</th>
        <th>単価</th>
        <th>加工方法</th>
        <th>単価</th>
        <th>小計</th>
      </tr>
      <tr v-for="(v, v_index) in selected.length" :key="`selected_${v_index}`">
        <td>
          <select v-model="selected[v_index].clothes">
            <option disabled value="">依頼する衣類を一つずつお選びください</option>
            <option v-for="(clothes, index) in clothes" :key="index" :value="clothes">
              {{ clothes.name }}
            </option>
          </select>
        </td>

        <td>
          <a>{{ selected[v_index].clothes.price }}</a>
        </td>

        <td>
          <select v-model="selected[v_index].processing">
            <option disabled value="">追加で加工を施したい場合はこちらからお選びください</option>
            <option v-for="(processing, index) in processings" :key="index" :value="processing">
              {{ processing.name }}
            </option>
          </select>
        </td>

        <td>
          <a>{{ selected[v_index].processing.price }}</a>
        </td>

        <td>
          <a>{{ selected[v_index].clothes.price + selected[v_index].processing.price }}</a>
        </td>

      </tr>
    </table>
  </div>
  <div>
    合計{{ totalPrice }}円
    <span v-if="totalPrice >= deliveryFreePrice">
      (送料無料)
    </span>
    <span v-else>
      あと{{ deliveryFreePrice - totalPrice }}円の注文で送料無料
    </span>
  </div>
  <button @click="increment">+</button>
  <button @click="decrement">-</button>
</template>

<script>
export default {
  props: {
    clothes: {
      type: Array,
      default: () => []
    },
    processings: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
      selected: [
        {
          clothes: {
          id: NaN,
          name: "",
          price: 0,
          },
          processing: {
          id: NaN,
          name: "",
          price: 0,
          }
        },
      ],
      deliveryFreePrice: 10000,
    };
  },
  methods: {
    increment() {
      this.selected.push({
        clothes: {
        id: NaN,
        name: "",
        price: 0
        },
        processing: {
        id: NaN,
        name: "",
        price: 0
        }
      });
    },
    decrement() {
      if (this.selected.length === 1) return;
      this.selected.pop();
    },
    setContent(index) {
      // 選択された商品の料金を取得
      const price = this.cloth_types.find(({ name }) => name === this.selected[index].name).price;
      // selectedにすでに同一のnameがある場合は対象の個数を1つ増やし, 新しく追加されているselectedは削除する, 重複行を削除するため
      if (this.selected.filter(({ name }) => name === this.selected[index].name).length > 1) {
        // 最初に見つかったselectedの個数を1つ増やす
        this.selected.find(({ name }) => name === this.selected[index].name).count++;
        // 重複しているselectedを削除
        this.selected = this.selected.filter((_, i) => i !== index);
        return;
      }
      // 選択された商品の個数が0の場合は1にする
      if (this.selected[index].count === 0) this.selected[index].count = 1;
      this.selected[index].price = price;
    },
  },
  computed: {
    totalPrice() {
      // 選択された商品の合計金額を計算
      return this.selected.reduce((acc, cur) => {
        const clothesPrice = cur.clothes.price;
        const proccesingPrice = cur.processing.price;
        return acc + clothesPrice + proccesingPrice;
      }, 0);
    },
  },
};
</script>

<style scoped>
.contents-table {
  border: 1px solid gray;
  margin: 10px;
}

.contents-table th,
.contents-table td {
  border: 1px solid gray;
}
</style>