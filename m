Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C99D4DBD67
	for <lists+kernel-janitors@lfdr.de>; Thu, 17 Mar 2022 04:10:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357784AbiCQDL6 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 16 Mar 2022 23:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358522AbiCQDL5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 16 Mar 2022 23:11:57 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B381E21277
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Mar 2022 20:10:41 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id p9so5485358wra.12
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Mar 2022 20:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U4Cs871ryV3jskArlUJXNj/tgZDn1LSZklEa26kOZ1c=;
        b=Mm0GSMqaQyv0EPiuAIPo+8UUsDKGk7BSCXjML4fwUhA7o4ncIZ/IfZzhYBRuOYKFFK
         mfjjR6ySkLHqqr/lO3syWnnka1dSl6KWxCVDTKMXefWiOqKR1GiUx1vYTpw+v6SH5fCS
         xocd+GVbstnngxmvzfazk+La1ldqjGMH4XNn2+fXSnjj9JbJeGKpjMpFa/Ec3/MfPICl
         HnjA38IrgBYQAJ19rNjs7a42wqIDYaYZFi4zC+wiVSUSg+TdOpiKrQYih1rk/6k0BAE6
         k8hrZeleEUsMgXP9gIm9Cd44dV8VN/F5u7R5kqKjZaQvBe2nR3r8i36n3RzOXmsT+g1x
         4YXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U4Cs871ryV3jskArlUJXNj/tgZDn1LSZklEa26kOZ1c=;
        b=yeFSbLpsD+nSe3NxJLmz5fx4djwEqZlS38UfYnlDFvTXY6K7vSKGCXNGGUfEpHnrIc
         1h45K+vIPL6TwZn2OzYKXy83LspJ56NWwtKtXLdJN56Kk6NcSmHTr2k/i9Vn9deG1MMt
         spCxIXuExs8ZGLwOcTRLQIrifil+p3Qds35e8XElYTqkRzfi1Bfy6/+T+t3xaHiAEElM
         prx7FYvPFqzBe556BIM1xtIyYPGAbsQIeHNW4zN5QVHgnSSJO9aZY0SEMllPo9J/KMHn
         zCiZWjHrsLjQV4N5hEf6h54bgolRCc2PG1gg4ESQb6vakuWhi4Pl+yei9FNhVC7Ovid0
         4XZw==
X-Gm-Message-State: AOAM530TUkUoAeknCiigYlgmHJUg6KhY5FkDxCh4dMOdUIvSfmYNQpUT
        lUv1RdI6F37GXaSikDUXiJnSKMMdI/TocVvWcrE9nQ==
X-Google-Smtp-Source: ABdhPJxUEpbLmZwl6Sw1kWg+uL3XJMn9zOtRkxxlnIJ8gwPfHabGLQ0spsfin5WGxjTjObtVf2p60c7BcCBRX3yyX5U=
X-Received: by 2002:a05:6000:11d0:b0:1f1:f6ea:f9a with SMTP id
 i16-20020a05600011d000b001f1f6ea0f9amr2226315wrx.40.1647486640162; Wed, 16
 Mar 2022 20:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220316232452.53062-1-colin.i.king@gmail.com>
In-Reply-To: <20220316232452.53062-1-colin.i.king@gmail.com>
From:   Ian Rogers <irogers@google.com>
Date:   Wed, 16 Mar 2022 20:10:28 -0700
Message-ID: <CAP-5=fWA=OGggwz730ScghTmUqeWGSG3hXv2swCRKGafOOSiDg@mail.gmail.com>
Subject: Re: [PATCH] perf build-id: Fix spelling mistake "Cant" -> "Can't"
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-perf-users@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Mar 16, 2022 at 4:25 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There is a spelling mistake in a pr_err message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/build-id.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/build-id.c b/tools/perf/util/build-id.c
> index 7a5821c87f94..82f3d46bea70 100644
> --- a/tools/perf/util/build-id.c
> +++ b/tools/perf/util/build-id.c
> @@ -762,7 +762,7 @@ build_id_cache__add(const char *sbuild_id, const char *name, const char *realnam
>
>                 len = readlink(linkname, path, sizeof(path) - 1);
>                 if (len <= 0) {
> -                       pr_err("Cant read link: %s\n", linkname);
> +                       pr_err("Can't read link: %s\n", linkname);
>                         goto out_free;
>                 }
>                 path[len] = '\0';
> --
> 2.35.1
>
