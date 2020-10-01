Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35C2527F6DD
	for <lists+kernel-janitors@lfdr.de>; Thu,  1 Oct 2020 02:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731663AbgJAAs5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 30 Sep 2020 20:48:57 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:37859 "EHLO
        smtp-fw-6002.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730155AbgJAAs5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 30 Sep 2020 20:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1601513336; x=1633049336;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=mK+4P3J38WGKTB1UiRU+yIEHfiYFZslujOQHMvGJct4=;
  b=hiVSB17sYMb2iwRDI7E2RM4CpNDrsOzdzwlqZ1Yvi5Z/RJMpzwodixun
   w9czOd94RQy/Krh2ksg2vrCMM+/hORMlts0iuN0BP/nKvBDgO+yS548WU
   4YRhtxedYKT9HxFByuNhTWZ0SOMJ954GUHat0ddkxhwQ7gfL9gPPmZL7F
   I=;
X-IronPort-AV: E=Sophos;i="5.77,322,1596499200"; 
   d="scan'208";a="57312749"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP; 01 Oct 2020 00:48:54 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
        by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS id 21725A0835;
        Thu,  1 Oct 2020 00:48:52 +0000 (UTC)
Received: from EX13D01UWB002.ant.amazon.com (10.43.161.136) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 1 Oct 2020 00:48:51 +0000
Received: from f8ffc2228008.ant.amazon.com (10.43.161.71) by
 EX13d01UWB002.ant.amazon.com (10.43.161.136) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 1 Oct 2020 00:48:47 +0000
Subject: Re: [PATCH -next for tip:x86/pti] x86/tlb: drop unneeded local vars
 in enable_l1d_flush_for_task()
From:   "Singh, Balbir" <sblbir@amazon.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>
CC:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "x86@kernel.org" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>
References: <20200928124457.27289-1-lukas.bulwahn@gmail.com>
 <20200929071211.GJ2628@hirez.programming.kicks-ass.net>
 <20200929083709.GC2651@hirez.programming.kicks-ass.net>
 <87eemji887.fsf@nanos.tec.linutronix.de>
 <20200930170316.GB2628@hirez.programming.kicks-ass.net>
 <87blhni1pg.fsf@nanos.tec.linutronix.de>
 <20200930183552.GG2628@hirez.programming.kicks-ass.net>
 <87k0wbgd2s.fsf@nanos.tec.linutronix.de>
 <19f57cbe-ba33-17d5-440c-2765e670782f@amazon.com>
Message-ID: <044e9835-f4fe-6670-90df-15fe376ecadd@amazon.com>
Date:   Thu, 1 Oct 2020 10:48:44 +1000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <19f57cbe-ba33-17d5-440c-2765e670782f@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.43.161.71]
X-ClientProxiedBy: EX13D48UWA001.ant.amazon.com (10.43.163.52) To
 EX13d01UWB002.ant.amazon.com (10.43.161.136)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 1/10/20 9:49 am, Singh, Balbir wrote:
> On 1/10/20 7:38 am, Thomas Gleixner wrote:
> 
>>
>>
>>
>> On Wed, Sep 30 2020 at 20:35, Peter Zijlstra wrote:
>>> On Wed, Sep 30, 2020 at 08:00:59PM +0200, Thomas Gleixner wrote:
>>>> On Wed, Sep 30 2020 at 19:03, Peter Zijlstra wrote:
>>>>> On Wed, Sep 30, 2020 at 05:40:08PM +0200, Thomas Gleixner wrote:
>>>>> Also, that preempt_disable() in there doesn't actually do anything.
>>>>> Worse, preempt_disable(); for_each_cpu(); is an anti-pattern. It mixes
>>>>> static_cpu_has() and boot_cpu_has() in the same bloody condition and has
>>>>> a pointless ret variable.
>>>
>>> Also, I forgot to add, it accesses ->cpus_mask without the proper
>>> locking, so it could be reading intermediate state from whatever cpumask
>>> operation that's in progress.
>>
>> Yes. I saw that after hitting send. :(
>>
>>>> I absolutely agree and I really missed it when looking at it before
>>>> merging. cpus_read_lock()/unlock() is the right thing to do if at all.
>>>>
>>>>> It's shoddy code, that only works if you align the planets right. We
>>>>> really shouldn't provide interfaces that are this bad.
>>>>>
>>>>> It's correct operation is only by accident.
>>>>
>>>> True :(
>>>>
>>>> I understand Balbirs problem and it makes some sense to provide a
>>>> solution. We can:
>>>>
>>>>     1) reject set_affinity() if the task has that flush muck enabled
>>>>        and user space tries to move it to a SMT enabled core
>>>>
>>>>     2) disable the muck if if detects that it is runs on a SMT enabled
>>>>        core suddenly (hotplug says hello)
>>>>
>>>>        This one is nasty because there is no feedback to user space
>>>>        about the wreckage.
>>>
>>> That's and, right, not or. because 1) deals with sched_setffinity()
>>> and 2) deals wit hotplug.
>>
>> It was meant as AND of course.
>>
>>> Now 1) requires an arch hook in sched_setaffinity(), something I'm not
>>> keen on providing, once we provide it, who knows what strange and
>>> wonderful things archs will dream up.
>>
>> I don't think so. We can have that magic in core:
>>
>> #ifdef CONFIG_HAS_PARANOID_L1D_FLUSH
>> static bool paranoid_l1d_valid(struct task_struct *tsk,
>>                                const struct cpumask *msk)
>> {
>>         if (!test_tsk_thread_flag(tsk, TIF_SPEC_L1D_FLUSH))
>>                 return true;
>>         /* Do magic stuff */
>>         return res;
>> }
>> #else
>> static bool paranoid_l1d_valid(struct task_struct *tsk,
>>                                const struct cpumask *msk)
>> {
>>         return true;
>> }
>> #endif
>>
>> It's a pretty well defined problem and having the magic in core code
>> prevents an arch hook which allows abuse of all sorts.
>>
>> And the same applies to enable_l1d_flush_for_task(). The only
>> architecture specific nonsense are the checks whether the CPU bug is
>> there and whether the hardware supports L1D flushing.
>>
>> So we can have:
>>
>> #ifdef CONFIG_HAS_PARANOID_L1D_FLUSH
>> int paranoid_l1d_enable(struct task_struct *tsk)
>> {
>>         /* Do the SMT validation under the proper locks */
>>         if (!res)
>>                 set_task_thread_flag(tsk, TIF_SPEC_L1D_FLUSH);
>>         return res;
>> }
>> #endif
>>
>>> And 2) also happens on hot-un-plug, when the task's affinity gets
>>> forced because it became empty. No user feedback there either, and
>>> information is lost.
>>
>> Of course. It's both that suddenly SMT gets enabled on a core which was
>> isolated and when the last isolated core in the tasks CPU mask goes
>> offline.
>>
>>> I suppose we can do 2) but send a signal. That would cover all cases and
>>> keep it in arch code. But yes, that's pretty terrible too.
>>
>> Bah. I just looked at the condition to flush:
>>
>>         if (sched_smt_active() && !this_cpu_read(cpu_info.smt_active) &&
>>                 (prev_mm & LAST_USER_MM_L1D_FLUSH))
>>                 l1d_flush_hw();
>>
>> That fails to flush when SMT is disabled globally. Balbir?
>>
>> Of course this should be:
>>
>>         if (!this_cpu_read(cpu_info.smt_active) && (prev_mm & LAST_USER_MM_L1D_FLUSH))
>>                 l1d_flush_hw();
>>
>> Now we can make this:
>>
>>         if (unlikely(prev_mm & LAST_USER_MM_L1D_FLUSH)) {
>>                 if (!this_cpu_read(cpu_info.smt_active))
>>                         l1d_flush_hw();
>>                 else
>>                         task_work_add(...);
>>
>> And that task work clears the flag and sends a signal. We're not going
>> to send a signal from switch_mm() ....
>>
>> Thanks,
>>
> 
> 
> So this is the change I am playing with, I don't like the idea of killing the task, but it's better than silently not flushing, I guess system administrators will learn with time not to correctly the affinity of tasks flushing
> L1D. For the affinity bits, not being able to change the affinity is better, but not being able to provide feedback on as to why is a bit weird as well, but I wonder if there are other cases where we might want to lock the affinity of a task for it's lifetime.
> 
> diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> index 6b0f4c88b07c..6b0d0a9cd447 100644
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -320,26 +320,15 @@ int enable_l1d_flush_for_task(struct task_struct *tsk)
>  
>  	/*
>  	 * Do not enable L1D_FLUSH_OUT if
> -	 * b. The CPU is not affected by the L1TF bug
> -	 * c. The CPU does not have L1D FLUSH feature support
> -	 * c. The task's affinity is on cores with SMT on.
> +	 * a. The CPU is not affected by the L1TF bug
> +	 * b. The CPU does not have L1D FLUSH feature support
>  	 */
>  
>  	if (!boot_cpu_has_bug(X86_BUG_L1TF) ||
> -			!static_cpu_has(X86_FEATURE_FLUSH_L1D))
> +		!boot_cpu_has(X86_FEATURE_FLUSH_L1D))
>  		return -EINVAL;
>  
> -	cpu = get_cpu();
> -
> -	for_each_cpu(i, &tsk->cpus_mask) {
> -		if (cpu_data(i).smt_active == true) {
> -			put_cpu();
> -			return -EINVAL;
> -		}
> -	}
> -
>  	set_ti_thread_flag(&tsk->thread_info, TIF_SPEC_L1D_FLUSH);
> -	put_cpu();
>  	return ret;
>  }
>  
> @@ -349,6 +338,12 @@ int disable_l1d_flush_for_task(struct task_struct *tsk)
>  	return 0;
>  }
>  
> +static void l1d_flush_kill(struct callback_head *ch)
> +{
> +	clear_ti_thread_flag(&current->thread_info, TIF_SPEC_L1D_FLUSH);
> +	force_signal(SIGBUS);
> +}
> +
>  void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>  	       struct task_struct *tsk)
>  {
> @@ -443,12 +438,14 @@ static void cond_mitigation(struct task_struct *next)
>  	}
>  
>  	/*
> -	 * Flush only if SMT is disabled as per the contract, which is checked
> -	 * when the feature is enabled.
> +	 * Flush only if SMT is disabled, if flushing is enabled
> +	 * and we are on an SMT enabled core, kill the task
>  	 */
> -	if (sched_smt_active() && !this_cpu_read(cpu_info.smt_active) &&
> -		(prev_mm & LAST_USER_MM_L1D_FLUSH))
> -		l1d_flush_hw();
> +	if (unlikely(prev_mm & LAST_USER_MM_L1D_FLUSH)) {
> +		if (!this_cpu_read(cpu_info.smt_active))
> +			l1d_flush_hw();
> +		else
> +			task_work_add(prev, l1d_flush_kill, true);

We have no access the to the previous task and mm->owner depends on MEMCG :)
We can do the magic in mm_mangle_tif_spec_bits(), I suppose

Balbir


