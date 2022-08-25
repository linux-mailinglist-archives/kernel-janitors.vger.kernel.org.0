Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1875A0D78
	for <lists+kernel-janitors@lfdr.de>; Thu, 25 Aug 2022 12:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238015AbiHYKEF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 25 Aug 2022 06:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235053AbiHYKEE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 Aug 2022 06:04:04 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6F7A61F6
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Aug 2022 03:04:02 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id r1-20020a056830418100b0063938f634feso6349182otu.8
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Aug 2022 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=NcQgfGWmNtGVcmYOkqhvmNWuEth66CXwSKmPdJfqqgM=;
        b=HmtXsgItV0eRNac4iZcsE7l7v0NFG3KbFYjOLUyRf0WVYGZxBQMdeeiW2Cu9mcGMVz
         xd7w3P9Ui+5UzudVIO+wH7GZ+6/tdW1N8kbSzfgk0zcgHW4JUtfDnPmJZpY0nR+fTJYh
         cf0zJASobZoYYmYbr7vjscb5ua6m3D4N3FDNY51YxPnWzGf4KUYdFbtazDpKyKtCBB0t
         Ssmphk/ooPJfOOE7ZlXpboyKndP1a+Gf2UloMIIjQ7VxCoVmixGjOj5ukZ4FX6TbPwE/
         YwU7zf6j3IatVMI0EcchrGk5hj+o4nMh1A3uMb5LAgacl5j+3V1z4KV2cwipG/NQ0rhc
         MBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=NcQgfGWmNtGVcmYOkqhvmNWuEth66CXwSKmPdJfqqgM=;
        b=lxIxkbICGnHL6JmSvUIKw9yDqjf5LU7g5HkmaWO7nBJmfTwsfORVegbJj21YkWqp88
         ggNwlcZM1wSYfs4iKKHjhOAPbkN1+Tq50ZdyvIwf9J04COhF8KLP+Xq4lg+i1uAisLwR
         fptW3yHyBU9+dRNm8+Nrcou7W6rvmcvSolU7UE2Xq3HcLqqLnP90cNp14O3Fa8gsVHa3
         31uM6giuS2T1eDg6IX/9cT1f42/29p+BBvKcOAepA7EbRU7+fPU9ssKSOiukvbtL2kmX
         zXu1gWzkKyLkPWVdJmCuOI10UbZOpj0e8Ta/6cod4VY8JOsOlmSBM0Vo6JKZt3tz1beX
         XcTQ==
X-Gm-Message-State: ACgBeo3g3eIdABGa7RY5U6N5PY1Zemnu+rQvo5sc4Etle5gQFHKwxCMo
        9Lsxc9ksveFBLXS2vJ/xDaUF8dXum7Rc54O0R7g=
X-Google-Smtp-Source: AA6agR4UVTo8JtsJD99Rn8HVIQXJqgXUQHNxw57N/tTLCLUi0szfYLbIG+OAHJbOALeFOp4esWLkplupsRFWzS/60hY=
X-Received: by 2002:a9d:4c08:0:b0:639:2bc3:947a with SMTP id
 l8-20020a9d4c08000000b006392bc3947amr1059830otf.122.1661421841928; Thu, 25
 Aug 2022 03:04:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:5ec3:0:0:0:0:0 with HTTP; Thu, 25 Aug 2022 03:04:01
 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   kayla manthey <tadjokes@gmail.com>
Date:   Thu, 25 Aug 2022 10:04:01 +0000
Message-ID: <CAHi6=KbR6o8iaAaQEyeBFxfVqKNygEfTju3Y+9j-10r5Fq71WQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:332 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4982]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tadjokes[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [sgtkaylla202[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Bok draga, mogu li razgovarati s tobom, molim te?
