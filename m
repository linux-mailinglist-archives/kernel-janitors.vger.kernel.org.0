Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53D7249F70
	for <lists+kernel-janitors@lfdr.de>; Wed, 19 Aug 2020 15:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbgHSNTR (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 19 Aug 2020 09:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728176AbgHSNRZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Aug 2020 09:17:25 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52732C061343
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Aug 2020 06:17:25 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id c16so26225722ejx.12
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Aug 2020 06:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dateHzfZw4hPd5wFKbYuTwuR2vJkBtjz6R2J9fChvLQ=;
        b=Ev6IiYZ+OlH/SLqTtba7hvYAp8ZrC6H01bllc6jG+Y5MVimN3xs0fUUEGorLZEJEaz
         L/iZOR1mKogDqsk4V33A9qSfOwIJxoKeiczOZ/g+OnoZnxAZUzdIhc9SToh7CDd5y2YA
         PVDNLrUeMi3cVmklmjDL8B+j7houk5N26aHhoAY5peALSzS2nuPCzFIqXiGKUn1oR0/y
         B5a8qqpwlC7yewZnECWudOrH6bWg5/+OzxGieVIjdtxHq17DWEd/LoZuLyhFi1riXG7I
         055uWs7qw9OPmv1Ybi84aIl0KiAMHZimEKX6cq+FhlYtGf0A/o/r5obMctbu5wOBJTJf
         3Crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dateHzfZw4hPd5wFKbYuTwuR2vJkBtjz6R2J9fChvLQ=;
        b=BXnDCOWM5LtBOIFdpwb2IAalLNwnPGWHr7d0wQ/UIgXUA+HNO9njtjAf+DmQy6G4Bb
         eiyagBwiLEvUEFQrveObUBYhvima92pg/dXzYeRM4YvTZ2Uz0HJGeQzm1zXX08HWsOAn
         5T/5Bvg/II/MkVkl5IlPLskXg2aAvcwHpdTchFoi+5mRNNLGGGr/7aGkkQQsdWexBi3b
         WkcXIYhjTMOQtIt8WJsWXmPL50WuJqJ0LIwf760Xca+oCmJ4V75cgfaiNn5lK/KueeOw
         TyrqLJAnL/luy8fpX/wjs+nNI6BSh5PT6gJM6IXrYTSr5mk+G4uiX8bwfnO9dV5YLFur
         QOsg==
X-Gm-Message-State: AOAM531UQPHMY75MMKSV1xytJYWmNLPFOVgqyPMTSSf0pdeuHw8mgRxg
        StVffoOTkVMJrhkXx4vLS8YgN4Fy4Hh715nX0g9f
X-Google-Smtp-Source: ABdhPJw7o0oSLKVTy4vNrzJxrl5baivYKPqVk7Brenppe5r+YscBH7pUQ9pcxpXLBtWTQrqYlPLDgY4/FfPIriQqf1s=
X-Received: by 2002:a17:906:1911:: with SMTP id a17mr23590862eje.431.1597843043948;
 Wed, 19 Aug 2020 06:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200819104256.51499-1-colin.king@canonical.com>
In-Reply-To: <20200819104256.51499-1-colin.king@canonical.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 19 Aug 2020 09:17:13 -0400
Message-ID: <CAHC9VhS3wvL43t+J=nhXiMj+1L+Ayso7+mO0z0KEM5uSfyM0mQ@mail.gmail.com>
Subject: Re: [PATCH][next] selinux: fix allocation failure check on newpolicy->sidtab
To:     Colin King <colin.king@canonical.com>
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Ondrej Mosnacek <omosnace@redhat.com>, selinux@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Aug 19, 2020 at 6:42 AM Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The allocation check of newpolicy->sidtab is null checking if
> newpolicy is null and not newpolicy->sidtab. Fix this.
>
> Addresses-Coverity: ("Logically dead code")
> Fixes: c7c556f1e81b ("selinux: refactor changing booleans")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  security/selinux/ss/services.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks Colin, merged into selinux/next.

-- 
paul moore
www.paul-moore.com
