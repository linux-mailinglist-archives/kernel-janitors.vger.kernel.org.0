Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B4D72A057
	for <lists+kernel-janitors@lfdr.de>; Fri,  9 Jun 2023 18:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjFIQls (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 9 Jun 2023 12:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjFIQlp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Jun 2023 12:41:45 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 292083594
        for <kernel-janitors@vger.kernel.org>; Fri,  9 Jun 2023 09:41:39 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f7fcdc7f7fso13542515e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Jun 2023 09:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686328897; x=1688920897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+1AVcllAn3iwjU08yRkcnifxFt3/r67zY2TJ0SgpYBA=;
        b=foi5I/JjKsd9mKLtadBqvhTs09YbWm1o2f3JMKkQFRGoYngq/yElwdYE2s3mtS26FB
         dpNAfgiU03NFa0HNsUf8HDsr5ZFhLGEKcrEKGTKa6UKlZdx8ACFtLJgm1ifBH+FEo4qG
         Hz9RDJeoH1Qg/SYjW05Z6GUlHMq2gVZffPoITVHqFqmZeI3vh4jkujBUwNWzP3ghWPhl
         Xj3mTI5Q89KPZGlFdl6nODpz8eK9ALAWSbViHpojR3DehTbHJrHz+TPVhlzABqzthIvq
         5Y8AAscfUMVBzjkm6hxVepTi758I0aaMiNqEMZcQBiqBzvx4uYO48AMKxaPVTVhMePtK
         QpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686328897; x=1688920897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1AVcllAn3iwjU08yRkcnifxFt3/r67zY2TJ0SgpYBA=;
        b=ISAHQehQYW3yKDrsN38DOxmn6K/uad6qn9Trgtwqcwr3JORvLcwt3rhhSpLHI684GD
         +a0J1pNB5cRG57Mki3I0sQeN+O8dbUVGEaV2gOFpsI2SLex/1Ansv+jMRr7EOAze32TF
         e5WtOGkVWF2P1SIGpEt6Lb4M3ANCFJVDvrQYub/kaGyiA6L78ufcVjJixwDi2btX6eVc
         +UswHozPqu5+yNSWDjkDUSiYa6Kl5D7Gv+2C+71iVaQHgud140qaX5sLg1BYUfts8dWD
         gcPrH8X684Q/gfpPmVkqm4zSrbtvXROWrpjwEPdVX6uroxH2DE9EauJHjznljLoXlmAc
         IQVQ==
X-Gm-Message-State: AC+VfDy3Geymrfp6d6Ppoga2q/HMp5kCkzT4igabE9/Fj4HcOiYe5fgM
        2VjQvY2taqDvQpYE6T8+sa4bWg==
X-Google-Smtp-Source: ACHHUZ4Hsb2q/diC3uQ3TI+OPWBWwVbviqd4QrCSbVAoe/3VEZOtD+ToJA9prjtmGOy2j4UO99NBZw==
X-Received: by 2002:a1c:7417:0:b0:3f6:84:3df6 with SMTP id p23-20020a1c7417000000b003f600843df6mr1925729wmc.10.1686328897648;
        Fri, 09 Jun 2023 09:41:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d650f000000b0030adfa48e1esm4877615wru.29.2023.06.09.09.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:41:35 -0700 (PDT)
Date:   Fri, 9 Jun 2023 19:41:31 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Xin Long <lucien.xin@gmail.com>
Cc:     Vlad Yasevich <vladislav.yasevich@hp.com>,
        Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-sctp@vger.kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2 net] sctp: fix an error code in sctp_sf_eat_auth()
Message-ID: <7899ff13-ab06-4970-a306-85b218486571@kadam.mountain>
References: <4629fee1-4c9f-4930-a210-beb7921fa5b3@moroto.mountain>
 <bfb9c077-b9a6-47f4-8cd8-a7a86b056a21@moroto.mountain>
 <CADvbK_f25PEaR1bSuyqeGQsoOp0v1Psaeu2zPhfEi8Zcu-J5Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADvbK_f25PEaR1bSuyqeGQsoOp0v1Psaeu2zPhfEi8Zcu-J5Tw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 09, 2023 at 11:13:03AM -0400, Xin Long wrote:
> This one looks good to me.
> 
> But for the patch 1/2 (somehow it doesn't show up in my mailbox):
> 
>   default:
>   pr_err("impossible disposition %d in state %d, event_type %d, event_id %d\n",
>         status, state, event_type, subtype.chunk);
> - BUG();
> + error = status;
> + if (error >= 0)
> + error = -EINVAL;
> + WARN_ON_ONCE(1);
> 
> I think from the sctp_do_sm() perspective, it expects the state_fn
> status only from
> enum sctp_disposition. It is a BUG to receive any other values and
> must be fixed,
> as you did in 2/2. It does the same thing as other functions in SCTP code, like
> sctp_sf_eat_data_*(), sctp_retransmit() etc.

It is a bug, sure.  And after my patch is applied it will still trigger
a stack trace.  But we should only call the actual BUG() function
in order to prevent filesystem corruption or a privilege escalation or
something along those lines.

Calling BUG() makes the system unusable so it makes bugs harder to
debug.  This is even mentioned in checkpatch.pl "Do not crash the kernel
unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery
code (if feasible) instead of BUG() or variants".

regards,
dan carpenter

