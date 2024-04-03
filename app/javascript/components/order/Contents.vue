<template>
  <div class="app-container">
    <el-form v-for="(v, v_index) in selected" :key="`selected_${v_index}`" label-width="120px">
      <el-row :gutter="20">
        <el-col :span="8">
          <el-form-item label="衣類カテゴリー" />
          <el-select v-model="selected[v_index].clothes" placeholder="依頼する衣類を一つずつお選びください">
            <el-option v-for="clothes in clothes" :key="clothes" :label="clothes.name" :value="clothes">
            </el-option>
          </el-select>
        </el-col>
        <el-col :span="8">
          <el-form-item label="料金" />
          <el-input v-model="selected[v_index].clothes.price" readonly></el-input>
        </el-col>
      </el-row>
    </el-form>

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
  </div>
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
            id: null,
            name: "",
            price: 0,
          },
          processing: {
            id: null,
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
          id: null,
          name: "",
          price: 0
        },
        processing: {
          id: null,
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

.el-row {
  margin-bottom: 20px;
}

.el-row:last-child {
  margin-bottom: 0;
}

.el-col {
  border-radius: 4px;
}

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}
</style>