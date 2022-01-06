# smart-fancontrol
Fan / Heat control for my laptop

### What this does

Keeps the fan level low and manages the power budget of the CPU to keep within a
reasonable temperature range.

### Alternatives

You should almost certainly use **thermal-daemon** and forget this repo exists. ;)
  - [thermal-deamon](https://github.com/intel/thermal_daemon)
    - Add --ignore-cpuid-check to the /usr/sbin/thermald invocation in the startup script
    - Use thinkpad_acpi to set fan level
  - [throttled](https://github.com/erpalma/throttled)

### Why this exists

In 2021 bought a Lenovo ThinkPad P14s gen 2 and it was extremely noisy.
Basically the fan was running at 4000+ RPM all the time.

I've owned many ThinkPads and knew about the thinkpad_acpi driver.
This allowed me to set a more reasonable fan level, 
but started experiencing extreme throttling.
At first, I tried disabling the GPU and writing a simple heuristic
to spin up the fan if the CPU started to get warm. But this didn't
always work and worse failed when I was doing anything demanding
like making a presentation to an audience of hundreds in Zoom. :-(

At first I thought this was entirely a thermal management issue and reading about
[others](https://forums.lenovo.com/t5/ThinkPad-P-and-W-Series-Mobile-Workstations/P14s-Gen-2-Intel-Heat-issue-CPU-throttling-and-fan-problems/m-p/5087833) have experienced this issue with the same laptop as well.
experience led me to try to make a more sophisticated fan controller to try to
keep the fan level low as long as possible but spin it up intelligently to avoid
getting into this throttling issue. It appeared to happen after the CPU had been
at 50C for 10 minutes or so. At that point max speed would drop from 2800 Mhz to
400 Mhz. My plan was to implement a heuristic, then a linear ML model, then a model
with memory and finally an RL model.

But then I looked at some data sheets that said the CPU (i7-1165G7) could go up to 100C
and the GPU (T500) up to 94C. And I found that similar throttling issues were reported for the 
[T480 and T480s](https://www.reddit.com/r/thinkpad/comments/870u0a/t480s_linux_throttling_bug/).
I happen to also have a T480s, but didn't experience this issue with
that laptop. Probably because I went with a low spec CPU for that
laptop. My P14s didn't have the same 80C trip point issue. It seemed to be set
to trip at 100C but was actually tripping at 50C!

Looking at the intel-rapl values, I found that something was setting the CPU power budget to
5 Watts. The range for the CPU on the [data sheet](https://ark.intel.com/content/www/us/en/ark/products/208921/intel-core-i71165g7-processor-12m-cache-up-to-4-70-ghz-with-ipu.html)
 is 12 to 28 Watts. No wonder the performance was so awful! This power budget is what actually
drives the performance. The cpufreq governor and driver have to operate within this power budget.

Ubuntu actually ships with a deamon that manages the power budget! It's the thermal-deamon
mentoned in the alternatives section above. Unfortunately, it disables itself when the
thinkpad_acpi driver is loaded. You can make sure it does it's job by adding --ignore-cpuid-check
to the ExecStart line in the systemd /lib/systemd/system/thermald.service file. This will
prevent the catostrophic level of throttling that happens when nothing is managing the power
budget.

Had I known what I know now I would have
    - enabled thinkpad_acpi with options fan_control=1
    - written a small script to echo "level 1" to "/proc/acpi/ibm/fan" at startup
    - re-enabled the thermal-deamon with --ignore-cpuid-check

Then called it a day...

But at this point my script is able to squeeze more performance out of the CPU and GPU
than the thermal-deamon can. It will burn through your batteries a lot faster and uses
up a fair bit of CPU itself, and runs the CPU hotter! So you are almost certainly better
off doing what I should have done way back when.