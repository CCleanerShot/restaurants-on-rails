<script>
    import { testState } from "../states/testState.svelte.ts";

    let counter = $state(0);

    const onclick = () => {
        counter++;
        testState.number--;
    }
</script>

<div>
    <span>{counter}</span>
    <button {onclick}>Test</button>
</div>