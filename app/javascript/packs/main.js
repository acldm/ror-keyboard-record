const Main = (function (e) {
    let state = [];
    e.addEventListener('keydown', () => {
        const time = Date.now();
        const newTime = {
            type: 'press',
            time
        }

        if (state.length > 0 && state[state.length - 1].type === "press") {
            state[state.length - 1] = newTime;
        } else {
            state.push(newTime);
        }

    });

    e.addEventListener('keyup', () => {
        const time = Date.now();
        const newTime = {
            type: 'release',
            time
        };

        if (state.length > 0 && state[state.length - 1].type === "release") {
            state[state.length - 1] = newTime;
        } else {
            state.push(newTime);
        }
    });

    const calcDiffList = (list) => {
        const times = [];
        for (let i = 0; i < list.length - 2; i+=1) {
            const pt = list[i].time;
            const nt = list[i + 1].time;
            times.push(nt - pt);
        }

        return times;
    }

    return {
        getState() {
            return state;
        },
        getTotalTime() {
            return state.length < 2 ? 0 : state[state.length - 1].time - state[0].time;
        },
        p2p() {
            const pressStates = state.filter(s => s.type === "press");
            return calcDiffList(pressStates);
        },
        p2r() {
            return calcDiffList(state);
        },
        r2p() {
            return calcDiffList(state.slice(1));
        },
        r2r() {
            const releaseStates = state.filter(s => s.type === "release");
            return calcDiffList(releaseStates);
        }

    }
});

window.addEventListener('load', () => {
    const content = document.querySelector("#content");
    let func = Main(content);
    window.func = func;
    const submit = document.querySelector("#submit");
    const total = document.querySelector("#total");
    const p2p = document.querySelector("#p2p");
    const p2r = document.querySelector("#p2r");
    const r2p = document.querySelector("#r2p");
    const r2r = document.querySelector("#r2r");
    submit.addEventListener('click', e => {
        total.value = func.getTotalTime();
        p2p.value = func.p2p().join(",");
        p2r.value = func.p2r().join(",");
        r2p.value = func.r2p().join(",");
        r2r.value = func.r2r().join(",");
    })
})