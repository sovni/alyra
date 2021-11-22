<template>
  <div v-if="isDrizzleInitialized" id="app">
    <h1>Vote</h1>
    <drizzle-contract-form
      contractName="Vote"
      method="voterRegistration"
      :placeholders="['Name']"
    />
    <h2>Nb Voters: {{ getNbVoters() }} </h2>

  </div>
  <div v-else>
    Loading application...
  </div>
</template>

<script>
import { mapGetters } from "vuex"
export default {
  name: "app",
  computed: {
    ...mapGetters("drizzle", ["drizzleInstance", "isDrizzleInitialized"]),
    ...mapGetters("contracts", ["getContractData"]),
    getNbVoters() {
      let data = this.getContractData({
        contract: "Vote",
        method: "getNbVoters"
      });
      if (data === "loading") return false;
      return data
    },
    utils() {
      return this.drizzleInstance.web3.utils
    }
  },
  created() {
    this.$store.dispatch("drizzle/REGISTER_CONTRACT", {
      contractName: "Vote",
      method: "getNbVoters",
      methodArgs: []
    })
  }
}
</script>