Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C32266E4FFD
	for <lists+kernel-janitors@lfdr.de>; Mon, 17 Apr 2023 20:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjDQSPt (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 17 Apr 2023 14:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjDQSPr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 Apr 2023 14:15:47 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEEAABF
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Apr 2023 11:15:46 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f08b6a9f8aso235425e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Apr 2023 11:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681755345; x=1684347345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5i2Qp6Zr5XsS0CkLKra0Q0zJ95GqTdwX7aDuJtPt47E=;
        b=hxWA9n7SM3eZcOdOSnHgGTaqGBDH8UEf70WwoLwr1I8nnzudNiiaPLEBEKZP/EgVmO
         cBgI4FJskvQqjHLE3HU8qgn7XmNrhCIn4NmzFYXVE1vymztu2q4yNPJc6ZFCyETC01hH
         L8Bk6iDtrvZTP6CqOg9KBs/aqshbI15/8Wd4roF0iC74lSu6VllAZdEReERLYUB8hnur
         bSBF6E9E5M71Ur6ocP2kCdIiJvQwSkA06ucqTPs1NjutznFAShVKXOJvYDFzhvb7FbWB
         plQuW2swiXwqxSUZdU1hPlTrrkYh2TYfLyP20/5qRgFCkbJpAfdXYTmCYB6u6tCFDxVX
         YyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681755345; x=1684347345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5i2Qp6Zr5XsS0CkLKra0Q0zJ95GqTdwX7aDuJtPt47E=;
        b=f+alHAhq0gghn9H77JgMpgGta9jsn+NpdJ/ivnTLknAvpIm4dGW2zNYE2xktHp1LYV
         xZ9tQpjBFYqS+zbeXzMzIu/JbRrzPf9rEFyF92WMGfz7K7mkjruj750nKuoWWujELRT5
         p5v6er/gKjw0LXaVK7wuKe8+zFExrKRUMgorxkBZZsguKFnTBuB16LGDjM7sRJoVAxoh
         yXX+ueGNyvigKk14N/Ziwe4bAtZVcJnrxPb9lgBFILEfaCl3nWA1FOL6jc7/wNpe0ghp
         RCLJmWno+r3yAWNwVuztrDnflEmL/8+2KRD4C7CepCLXCgaLZkC1u402pxN9Fdjecnir
         VHMQ==
X-Gm-Message-State: AAQBX9eYDmffJp4dwOgbsh1F0PER6Z+F+mBhKHD0Uu5Ut7VPGCxmyedG
        fRoMIeGEJO8FgAGWZWri8Cl/DY+3y8aOB2M5qVQ+1A==
X-Google-Smtp-Source: AKy350bKF8wLcEzplp4odtufmBi5eHxdPS6L+IFSKj8xFo7s1pmhW8Xqpb36IJ5eB1bmgLlXSrN8lfj63F/vNGJ7KgE=
X-Received: by 2002:a05:600c:4e03:b0:3f0:9ff0:3b1c with SMTP id
 b3-20020a05600c4e0300b003f09ff03b1cmr16042wmq.2.1681755345051; Mon, 17 Apr
 2023 11:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230417174826.52963-1-colin.i.king@gmail.com>
In-Reply-To: <20230417174826.52963-1-colin.i.king@gmail.com>
From:   Ian Rogers <irogers@google.com>
Date:   Mon, 17 Apr 2023 11:15:31 -0700
Message-ID: <CAP-5=fV2Lb33hf9o+HcErYn=SuLmy3smkeOoDy6BnX5-w=SYtQ@mail.gmail.com>
Subject: Re: [PATCH][next] perf script: task-analyzer: Fix spelling mistake
 "miliseconds" -> "millseconds"
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Petar Gligoric <petar.gligoric@rohde-schwarz.com>,
        Hagen Paul Pfeifer <hagen@jauu.net>,
        linux-perf-users@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Apr 17, 2023 at 10:48=E2=80=AFAM Colin Ian King <colin.i.king@gmail=
.com> wrote:
>
> There is a spelling mistake in the help for the --ms option. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Seems like a similar fix is needed to the patch Subject of
"millseconds" :-) Other than that:
Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/scripts/python/task-analyzer.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/scripts/python/task-analyzer.py b/tools/perf/scri=
pts/python/task-analyzer.py
> index 52e8dae9b1f0..3f1df9894246 100755
> --- a/tools/perf/scripts/python/task-analyzer.py
> +++ b/tools/perf/scripts/python/task-analyzer.py
> @@ -114,7 +114,7 @@ def _parse_args():
>          "--ns", action=3D"store_true", help=3D"show timestamps in nanose=
conds"
>      )
>      parser.add_argument(
> -        "--ms", action=3D"store_true", help=3D"show timestamps in milise=
conds"
> +        "--ms", action=3D"store_true", help=3D"show timestamps in millis=
econds"
>      )
>      parser.add_argument(
>          "--extended-times",
> --
> 2.30.2
>
