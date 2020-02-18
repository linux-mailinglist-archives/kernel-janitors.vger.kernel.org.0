Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAA8C162319
	for <lists+kernel-janitors@lfdr.de>; Tue, 18 Feb 2020 10:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgBRJMq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 18 Feb 2020 04:12:46 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:45242 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgBRJMp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Feb 2020 04:12:45 -0500
Received: from ip5f5bf7ec.dynamic.kabel-deutschland.de ([95.91.247.236] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1j3yvq-00087n-Kt; Tue, 18 Feb 2020 09:12:42 +0000
Date:   Tue, 18 Feb 2020 10:12:41 +0100
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>,
        kernel-janitors@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [bug report] clone3: allow spawning processes into cgroups
Message-ID: <20200218091241.mm7t2gtyilr63hij@wittgenstein>
References: <20200218064759.4n6vwqgtxqlysjsk@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200218064759.4n6vwqgtxqlysjsk@kili.mountain>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Feb 18, 2020 at 09:47:59AM +0300, Dan Carpenter wrote:
> Hello Christian Brauner,
> 
> The patch ef2c41cf38a7: "clone3: allow spawning processes into
> cgroups" from Feb 5, 2020, leads to the following static checker
> warning:
> 
> 	kernel/fork.c:2632 copy_clone_args_from_user()
> 	warn: unsigned 'args.cgroup' is never less than zero.

Thanks, good catch. This strikes me as a great patch for the
linux-kernel-mentees project so I've Cced the list.
I'll wait for about two weeks for a patch and if none has surfaced by
then I'll fix it myself.
For anyone wanting to fix this, please note that this patch sits in
Tejun's cgroup tree, i.e. your fix needs to be made against the
following tree:
https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git/log/?h=for-5.7

Thanks!
Christian

> 
> kernel/fork.c
>   2598  noinline static int copy_clone_args_from_user(struct kernel_clone_args *kargs,
>   2599                                                struct clone_args __user *uargs,
>   2600                                                size_t usize)
>   2601  {
>   2602          int err;
>   2603          struct clone_args args;
>   2604          pid_t *kset_tid = kargs->set_tid;
>   2605  
>   2606          if (unlikely(usize > PAGE_SIZE))
>   2607                  return -E2BIG;
>   2608          if (unlikely(usize < CLONE_ARGS_SIZE_VER0))
>   2609                  return -EINVAL;
>   2610  
>   2611          err = copy_struct_from_user(&args, sizeof(args), uargs, usize);
>   2612          if (err)
>   2613                  return err;
>   2614  
>   2615          if (unlikely(args.set_tid_size > MAX_PID_NS_LEVEL))
>   2616                  return -EINVAL;
>   2617  
>   2618          if (unlikely(!args.set_tid && args.set_tid_size > 0))
>   2619                  return -EINVAL;
>   2620  
>   2621          if (unlikely(args.set_tid && args.set_tid_size == 0))
>   2622                  return -EINVAL;
>   2623  
>   2624          /*
>   2625           * Verify that higher 32bits of exit_signal are unset and that
>   2626           * it is a valid signal
>   2627           */
>   2628          if (unlikely((args.exit_signal & ~((u64)CSIGNAL)) ||
>   2629                       !valid_signal(args.exit_signal)))
>   2630                  return -EINVAL;
>   2631  
>   2632          if ((args.flags & CLONE_INTO_CGROUP) && args.cgroup < 0)
>                                                         ^^^^^^^^^^^^^^^
> This is a u64 so it can't be negative.  I'm not sure what was intended.
> 
>   2633                  return -EINVAL;
>   2634  
> 
> regards,
> dan carpenter
