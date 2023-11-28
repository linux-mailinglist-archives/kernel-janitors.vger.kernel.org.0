Return-Path: <kernel-janitors+bounces-491-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A70E97FC068
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 18:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A82FB21453
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 17:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E7739AD0;
	Tue, 28 Nov 2023 17:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeQSHW8i"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694C5D64;
	Tue, 28 Nov 2023 09:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701193213; x=1732729213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nwg4S88oJ6FyLcG9HKMCl3XnJS49yk8sadUfeEszzH0=;
  b=QeQSHW8iSF0MUK2oRFEUw/aj4F3sMBxQRUPD89Da7k5H8/pr7O4XuUmZ
   v7gwu70HeIPMWDvGje+rmGtgnSj0DuOucuIO+2g55WudAeWB6CLn++5LJ
   sESWp+qTce1RCYGnt7FsIL7R/SzotY2gLRxJAWV1Unrx8WIPZeoXbo6sj
   xscEbqGUbxgNh367Uy02yqJkkD3MRlEAkvNAMT+oh3Fq7/n3G+m+wZgIL
   OXfxIvIQhz6Gg8UxeK82ozsP8Li+GgA5zeTXyy23my7ySD/BuT/eGJ8RR
   +sx6Yrp+H41kBbQDIPst6EU4b/mvBqL48YQ0WlmBNRWBwxFXg/kVwCETz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372350016"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="372350016"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 09:40:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="797647899"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="797647899"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.74])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 09:40:12 -0800
Date: Tue, 28 Nov 2023 09:40:11 -0800
From: Tony Luck <tony.luck@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Tom Lendacky <thomas.lendacky@amd.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [bug report] x86/split_lock: Make life miserable for split
 lockers
Message-ID: <ZWYl+ymwSRKzD+NL@agluck-desk3>
References: <6bc08e77-812f-4e9e-938a-6a13263ce9d1@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bc08e77-812f-4e9e-938a-6a13263ce9d1@moroto.mountain>

On Tue, Nov 28, 2023 at 04:12:24PM +0300, Dan Carpenter wrote:
> Hello Tony Luck,
> 
> The patch b041b525dab9: "x86/split_lock: Make life miserable for
> split lockers" from Mar 10, 2022 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	arch/x86/kernel/cpu/intel.c:1179 split_lock_warn()
> 	warn: sleeping in atomic context
> 
> arch/x86/kernel/cpu/intel.c
>     1158 static void split_lock_warn(unsigned long ip)
>     1159 {
>     1160         struct delayed_work *work;
>     1161         int cpu;
>     1162 
>     1163         if (!current->reported_split_lock)
>     1164                 pr_warn_ratelimited("#AC: %s/%d took a split_lock trap at address: 0x%lx\n",
>     1165                                     current->comm, current->pid, ip);
>     1166         current->reported_split_lock = 1;
>     1167 
>     1168         if (sysctl_sld_mitigate) {
>     1169                 /*
>     1170                  * misery factor #1:
>     1171                  * sleep 10ms before trying to execute split lock.
>     1172                  */
>     1173                 if (msleep_interruptible(10) > 0)
>     1174                         return;
>     1175                 /*
>     1176                  * Misery factor #2:
>     1177                  * only allow one buslocked disabled core at a time.
>     1178                  */
> --> 1179                 if (down_interruptible(&buslock_sem) == -EINTR)
>     1180                         return;
>     1181                 work = &sl_reenable_unlock;
>     1182         } else {
>     1183                 work = &sl_reenable;
>     1184         }
>     1185 
>     1186         cpu = get_cpu();
>     1187         schedule_delayed_work_on(cpu, work, 2);
>     1188 
>     1189         /* Disable split lock detection on this CPU to make progress */
>     1190         sld_update_msr(false);
>     1191         put_cpu();
>     1192 }
> 
> The call tree is:
> 
> kernel_exc_vmm_communication() <- disables preempt
> -> vc_raw_handle_exception()
>    -> vc_forward_exception()
>       -> exc_alignment_check()
>          -> __exc_alignment_check()
>             -> handle_user_split_lock()
>                -> split_lock_warn()
> 
> I think maybe the mismatch is that kernel_exc_vmm_communication() calls
> irqentry_nmi_enter(regs); which disable preemption but exc_alignment_check()
> does local_irq_enable() which doesn't enable it.

I think we need some arch/x86/kernel/sev.c expertise to explain the
preemption requirements in that stack trace. Adding Tom Lendacky.

> Also why does arch/x86 not have a dedicated mailing list?

Good question. X86 was once the default architecture. So everything went to
linux-kernel@vger.kernel.org. I'll add that to Cc: for this. But maybe
it's time for an x86 specific list?

> regards,
> dan carpenter

-Tony

