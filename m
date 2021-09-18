Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF65941086B
	for <lists+kernel-janitors@lfdr.de>; Sat, 18 Sep 2021 21:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238842AbhIRTr4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 18 Sep 2021 15:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238603AbhIRTrx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 18 Sep 2021 15:47:53 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F03C06175F
        for <kernel-janitors@vger.kernel.org>; Sat, 18 Sep 2021 12:46:28 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id a22so16641485iok.12
        for <kernel-janitors@vger.kernel.org>; Sat, 18 Sep 2021 12:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iBb2CNmqZ5yJZEpqh4Wu4xc0TDiPW7maAouxr+5+hGE=;
        b=iS0s339dCP4h3/LCVbgopEdTIpT2EbtD1KuFGEV0uFiBR/KM97ooF1F/oW4ikZ3rEr
         Ww8XPNz+KxFaJyQOIeemYZt7TGUNqJd22sq1jLPZ/5YPFt/HFO9dlKKufQEew7cCB6Nh
         B4zCAZfXUe20H8ge4RM5vuyGQKBVAlZmvShvVphPjws9VbPNCtI1IDYRpXhMICNZ90mW
         a/GlLeZSWcKetHqSb87HNaaQg3oeqmOuOdbGm27VB2mL77NvEcPJTUh/X7LVo4Dr5EcG
         lPre+l2oH3hXBRYjHcw9qsrajy4pya65v/vsdIJ4HryGZHCVQFGwfSUralCAIRhIoABH
         N0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iBb2CNmqZ5yJZEpqh4Wu4xc0TDiPW7maAouxr+5+hGE=;
        b=NpZLPhPouLhtH3SrVVOiv+BBErX3E1xlPuPwdYw7MKanbXef083Z2+qHSL900iNfSW
         HzOXY08aqTM/cfT2CYY3LxFWdxVnp3K0jPbR6lo+OifjL9kwmv374R+jeGD39KSZz6Sy
         RlKFoOvGlQLp71MU99s15pa2hG1ky2igWZh7AUYblWx9gNSf9pJTkYMSJuuvIWzCCQQa
         U9Uj985WQzVghlFy2Gv1gApVjGuYVkMV74SOgtr/RGV6vDIsXl80ZXyJUizqwJw2CcVx
         J84IzXpIaApRoFxVokXqlJvjC1Tt0ayJc8/Dr6RPrCujvYPEspAgSgDRu7/9iYN8fMrQ
         /9WQ==
X-Gm-Message-State: AOAM532ImdYphxd30+UvxWfneBW2wK7TMhfGTJYGVJx34qrDGY5PcdZ/
        0mbUSxU8/s5FJ+bo+EAbwWFi7vtCNPlkJrQOFQ99xA==
X-Google-Smtp-Source: ABdhPJw2xKkaW92kEwm1DQgmbMINViwg/zVsITjaKxzLn6jd3kJ6TBeAOhisCiVInMNjehQa5yywtLIcah3DfEKzpQg=
X-Received: by 2002:a05:6638:1e2:: with SMTP id t2mr4880575jaq.21.1631994387483;
 Sat, 18 Sep 2021 12:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210916081314.41751-1-colin.king@canonical.com>
In-Reply-To: <20210916081314.41751-1-colin.king@canonical.com>
From:   Ian Rogers <irogers@google.com>
Date:   Sat, 18 Sep 2021 12:46:16 -0700
Message-ID: <CAP-5=fXC9kb_6Xsfw17SHp1TeFJSi_uCotAtBSFRqCSWOZpk7A@mail.gmail.com>
Subject: Re: [PATCH] perf vendor events: Fix spelling mistake "icach" -> "icache"
To:     Colin King <colin.king@canonical.com>, Paul Clarke <pc@us.ibm.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-perf-users@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 16, 2021 at 1:13 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in the description text, fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/pmu-events/arch/powerpc/power8/other.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/pmu-events/arch/powerpc/power8/other.json b/tools/perf/pmu-events/arch/powerpc/power8/other.json
> index 84a0cedf1fd9..f1f2965f6775 100644
> --- a/tools/perf/pmu-events/arch/powerpc/power8/other.json
> +++ b/tools/perf/pmu-events/arch/powerpc/power8/other.json
> @@ -1046,7 +1046,7 @@
>    {
>      "EventCode": "0x4e010",
>      "EventName": "PM_GCT_NOSLOT_IC_L3MISS",
> -    "BriefDescription": "Gct empty for this thread due to icach l3 miss",
> +    "BriefDescription": "Gct empty for this thread due to icache l3 miss",
>      "PublicDescription": ""
>    },
>    {
> --
> 2.32.0
>
