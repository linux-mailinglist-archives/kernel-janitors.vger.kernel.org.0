Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB85C7A6ADF
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 Sep 2023 20:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232366AbjISSuE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 Sep 2023 14:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbjISSuD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Sep 2023 14:50:03 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2390B9E
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Sep 2023 11:49:57 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4047c6ec21dso18505e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Sep 2023 11:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695149395; x=1695754195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3b3SE1y993w9s8TptT+65qp+DeVHMyKSmy+Ooj7umuM=;
        b=PSFZ/zTb2uhWJFHReGyXjuajECuDa0FA67//VPxjG8dPGcqndKRXCnDu75IdUJyl+3
         WacmLDJnOk82+60rRfTE5Uw8Vlefi86Ye1XBpQI6JP6XVMYFu4wwX9RPshjcQcKdkNBV
         a+GNv4oDMVPrh5kyMkUrQI2Oi8+MoIN6gB74p1vUa8dmnvnfgUppg7fau3Bh4cd6tx4r
         FdKVdlVXx0RDtQQxhag+aILrrJJibvTs9DE8h0WOSQhOhnm3pzrVg8l5PEvdlBIGB4MH
         b9xjvQ4SlfdPiTwkA0cBsVOa32Tgzhr86Vb/1iJXiMNWVBwSKgFB0Fpr/O4okLB19+h0
         F+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695149395; x=1695754195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3b3SE1y993w9s8TptT+65qp+DeVHMyKSmy+Ooj7umuM=;
        b=DbMrphk2UtcS12lmsXAP/2zwkzkDWC4XKdBF1Btu87WhenVdjcT15DyTW6M24c4VYn
         ICg/m8yfOOSACHpHjoxFlxQw/3eRyIM7C0Se9R2sEFZnLFLuRYXx55xzurPDSXJwB//V
         aA9855ZxGMTBT4oljxkHAamg+e/LPuvK8GIlLAXCBTkVQNDos0iyNjjltE1cS44ypiiZ
         3m4wluIZMAXyeRROmlkXo/L9km01u9sDp+N6Y/CAMXQpcO6PLqpBuj24ssL6b24rd8Bf
         WSfTUvCMKNdQy3ueTPXNgJwwfi+Hu8wNZVjXvdYWZzMF4CcHdN+OyCIrd050ph/7a4YB
         kNYg==
X-Gm-Message-State: AOJu0YztDWbcVA3mR80Ji1P5B0wGPTmUmVsR7RqSiEmTj7gamt/ukQTX
        UubKqfTRlGj1R3Xu4ZEIxoGdxfuSK7cLL4lHDDGNNg==
X-Google-Smtp-Source: AGHT+IHdRcasEy33j0LLjfk3xBcc7G26qkdrcJaCdU/boWopbvtOxlEHTEfXJ/SqOn0lzR3O4BAc9O47dYEpPB99F4c=
X-Received: by 2002:a05:600c:1d09:b0:3fe:f32f:c57f with SMTP id
 l9-20020a05600c1d0900b003fef32fc57fmr16193wms.0.1695149395391; Tue, 19 Sep
 2023 11:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <3ff9d019-75b6-45ee-9b03-9d6ec7c5364f@moroto.mountain>
In-Reply-To: <3ff9d019-75b6-45ee-9b03-9d6ec7c5364f@moroto.mountain>
From:   Rae Moar <rmoar@google.com>
Date:   Tue, 19 Sep 2023 14:49:43 -0400
Message-ID: <CA+GJov4SRGa6scDUmm1Tzu8JX4ZaF8S7YVxwZVvYJMSLXVRwrw@mail.gmail.com>
Subject: Re: [PATCH] kunit: Check for kunit_parse_glob_filter() failure
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Daniel Latypov <dlatypov@google.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <davidgow@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Sep 15, 2023 at 8:58=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Smatch complains that the missing error checks would lead to a crash:
>
>     lib/kunit/executor_test.c:40 parse_filter_test()
>     error: double free of 'filter.test_glob'
>
> We may as well do it right...
>
> Fixes: a127b154a8f2 ("kunit: tool: allow filtering test cases via glob")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Hello!

We definitely should add in checks for these errors. I have a couple
comments below.

Thanks!
-Rae

> ---
>  lib/kunit/executor_test.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/lib/kunit/executor_test.c b/lib/kunit/executor_test.c
> index b4f6f96b2844..176c9c9dfcfc 100644
> --- a/lib/kunit/executor_test.c
> +++ b/lib/kunit/executor_test.c
> @@ -27,13 +27,15 @@ static void parse_filter_test(struct kunit *test)
>  {
>         struct kunit_glob_filter filter =3D {NULL, NULL};
>
> -       kunit_parse_glob_filter(&filter, "suite");
> +       if (!kunit_parse_glob_filter(&filter, "suite"))
> +               return;

First, this is returning every time this test is run because the
kunit_parse_glob_filter returns 0 when there is no error. So this
should instead be checking for a result of not equal to 0.

Secondly, this should fail the test if the parsing returns an error.
So instead of returning I would recommend using a KUNIT_ASSERT
statement to check the result of this method is equal to 0.

>         KUNIT_EXPECT_STREQ(test, filter.suite_glob, "suite");
>         KUNIT_EXPECT_FALSE(test, filter.test_glob);
>         kfree(filter.suite_glob);
>         kfree(filter.test_glob);
>
> -       kunit_parse_glob_filter(&filter, "suite.test");
> +       if (!kunit_parse_glob_filter(&filter, "suite.test"))
> +               return;

Similar to above I think this should be changed to a KUNIT_ASSERT
statement to ensure the result is equal to 0.

>         KUNIT_EXPECT_STREQ(test, filter.suite_glob, "suite");
>         KUNIT_EXPECT_STREQ(test, filter.test_glob, "test");
>         kfree(filter.suite_glob);
> --
> 2.39.2
>
> --
> You received this message because you are subscribed to the Google Groups=
 "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/kunit-dev/3ff9d019-75b6-45ee-9b03-9d6ec7c5364f%40moroto.mountain.
