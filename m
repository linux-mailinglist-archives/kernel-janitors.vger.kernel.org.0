Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 083A64E9805
	for <lists+kernel-janitors@lfdr.de>; Mon, 28 Mar 2022 15:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234359AbiC1N1K (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 28 Mar 2022 09:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiC1N1J (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Mar 2022 09:27:09 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31CF14B1EB
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Mar 2022 06:25:29 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id d5so24727936lfj.9
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Mar 2022 06:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oQ9NkK6m4ISKX48mZgjvlYxhfodVbZsFRnJ/DcAagPM=;
        b=OQhXT+WqyseUB5Y1uD9XABdZyHN4EZRfp4cdWWL3KmZxL3OMbE5sRyUr+nVbYQVN9L
         rbn9oj/WZQMr4r1dIs1tAsQ67Evk0k6UZbguGzdUYpGUURJiZs6XKFoY4nSYNtu8nX0M
         Mm4qqWD8nl/iSm6A5UTn9oIfsUn+TSsCMHeLB+QwnWJiZbFQCUjHZqcLYKJzk2s2nFaF
         LXFf9V2kfVmOxeNk/IfAU7GR7FXWYkkOM1eilV5EJubD+Kx+VlzP8q7A5jWbWAwVOoL+
         SB3jDlSaHsEQL+kqCcjXceO+QhSieMbCxA/pNfykjTgkFTW3579m0L8oQsHQ3g4W9eBl
         zQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oQ9NkK6m4ISKX48mZgjvlYxhfodVbZsFRnJ/DcAagPM=;
        b=AlZFeIk5VU2AjvFhYMHHjEP8Tlp9G/a7JgMJoET/60cjvUDtMPcBKbsyaXROfNGDQm
         EYyVCic6F7yISuW5y4qEpQD/NQ59r5liBGjFAzPkH/sPyYvgFjpSXpQk0qaSRQGyqDPB
         SAHDJJLqud4ZIy/6MVrLuIV1bYf1mzQkb8n8EkBKaCO3xpfQSDhT2Nk9uSg3ogooEiC7
         DjTJg/eqW7m77r4GTI21sbXKHMrWioI/rdKSiMpm+VhgPsXc0IqzRVpDm03buJq0fUFE
         +XQGLhyUdqxsEmVfzHOXAvm25fkFof7PL2R5r06xt4glbBm5QAo2kQxmMjnPhK+75Nnr
         Kh4Q==
X-Gm-Message-State: AOAM533+eB06ddTBPP51H2ppoRJ0t5e5YMjRbN8ohAK6FpqyH/SblgDr
        szY34sUONykZ3tfPq3a6n9QNUSE5dzbGDr8TYLrvVoW8
X-Google-Smtp-Source: ABdhPJzQtXjsKX6J1vlKVhi67hV0kE/vScNYDCDgIPIccuXGUT0wH+ZIqa039CYgz7uyWshFIw1uOJm6zmq443Czwms=
X-Received: by 2002:ac2:5e31:0:b0:44a:247d:6022 with SMTP id
 o17-20020ac25e31000000b0044a247d6022mr19433675lfg.509.1648473927445; Mon, 28
 Mar 2022 06:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAO64rh6_m6rx_=rPcEGLzzT5oaJFYzbE2RSQ-9zwk83ysj16wg@mail.gmail.com>
 <20220328131711.GS3293@kadam>
In-Reply-To: <20220328131711.GS3293@kadam>
From:   Harm Smits <harmsmitsdev@gmail.com>
Date:   Mon, 28 Mar 2022 15:25:14 +0200
Message-ID: <CAO64rh61eMd2ekWK-XmXpjNvRKVscdua=txEMF-fYp4qt+pp=w@mail.gmail.com>
Subject: Re: [question] Whats up with loading the GDT in startup_setup_env in x86_64?
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

After a bit more digging, I have figured out what's going on. The
compiler optimization passes seem to turn the absolute addressing into
relative addressing by means of %rip. Should I submit a patch to also
wrap it in `fixup_pointer` to make it in line with all the other .data
manipulation in `startup_64_load_idt` and `__startup_64`? This would
also avoid it from completely relying on an optimization pass which
might get changed in the future.

-- 
Kind regards,
Harm Smits
